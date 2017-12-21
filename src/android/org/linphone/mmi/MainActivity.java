package org.linphone.mmi;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.SearchView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import org.linphone.R;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreListenerBase;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.databinding.MainActivityBinding;
import org.linphone.mediastream.Log;
import org.linphone.mmi.adapter.CustomViewPagerAdapter;
import org.linphone.mmi.listener.AddressType;
import org.linphone.mmi.listener.onSearchQuerylistener;
import org.linphone.ui.AddressText;

import static android.content.Intent.ACTION_MAIN;

/**
 * Created by ceinfo on 12/6/17.
 */

public class MainActivity extends AppCompatActivity {

    private static final int PERMISSIONS_REQUEST_SYNC = 207;
    private static final int PERMISSIONS_REQUEST_CONTACTS = 208;

    private MainActivityBinding mMainActivtityBinding;
    private Handler mHandler = new Handler();
    private ServiceWaitThread mServiceThread;
    private LinphoneCoreListenerBase mListener;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mMainActivtityBinding = DataBindingUtil.setContentView(this, R.layout.main_activity);
        setSupportActionBar(mMainActivtityBinding.toolbar);

        if (LinphoneService.isReady()) {

            initUI();

        } else {
            // start linphone as background
            startService(new Intent(ACTION_MAIN).setClass(this, LinphoneService.class));
            mServiceThread = new ServiceWaitThread();
            mServiceThread.start();
        }


        mListener = new LinphoneCoreListenerBase() {
            @Override
            public void callState(LinphoneCore lc, LinphoneCall call, LinphoneCall.State state, String message) {
                if (state == LinphoneCall.State.IncomingReceived) {
                    startActivity(new Intent(MainActivity.this, DemoCallIncomingActivity.class));
                } else if (state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingProgress) {
                    startActivity(new Intent(MainActivity.this, DemoCallOutGoingActivity.class));
                } else if (state == LinphoneCall.State.CallEnd || state == LinphoneCall.State.Error || state == LinphoneCall.State.CallReleased) {
                    //
                }
            }
        };
    }

    private void checkSyncPermission() {
        checkAndRequestPermission(Manifest.permission.WRITE_SYNC_SETTINGS, PERMISSIONS_REQUEST_SYNC);
    }

    private void checkContactPermission() {
        checkAndRequestPermission(Manifest.permission.WRITE_CONTACTS, PERMISSIONS_REQUEST_CONTACTS);
    }

    public void checkAndRequestPermission(String permission, int result) {
        int permissionGranted = getPackageManager().checkPermission(permission, getPackageName());
        Log.i("[Permission] " + permission + " is " + (permissionGranted == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));

        if (permissionGranted != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.shouldShowRequestPermissionRationale(this, permission);
            Log.i("[Permission] Asking for " + permission);
            ActivityCompat.requestPermissions(this, new String[]{permission}, result);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (permissions.length <= 0)
            return;

        switch (requestCode) {
            case PERMISSIONS_REQUEST_SYNC:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    ContactsManager.getInstance().initializeSyncAccount(getApplicationContext(), getContentResolver());
                } else {
                    ContactsManager.getInstance().initializeContactManager(getApplicationContext(), getContentResolver());
                }
                break;

            case PERMISSIONS_REQUEST_CONTACTS:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    ContactsManager.getInstance().enableContactsAccess();
                    if (!ContactsManager.getInstance().contactsFetchedOnce()) {
                        ContactsManager.getInstance().enableContactsAccess();
                        ContactsManager.getInstance().fetchContactsAsync();
                    }
                }
                break;
        }
    }

    private void initUI() {


        if (getPackageManager().checkPermission(Manifest.permission.WRITE_SYNC_SETTINGS, getPackageName()) != PackageManager.PERMISSION_GRANTED) {
            checkSyncPermission();
        } else {
            if (LinphoneService.isReady()) {
                ContactsManager.getInstance().initializeSyncAccount(getApplicationContext(), getContentResolver());
            }
        }

        if (getPackageManager().checkPermission(Manifest.permission.WRITE_CONTACTS, getPackageName()) != PackageManager.PERMISSION_GRANTED) {
            checkContactPermission();
        } else {
            if (LinphoneService.isReady()) {
                ContactsManager.getInstance().initializeContactManager(getApplicationContext(), getContentResolver());
            }
        }

        if (!ContactsManager.getInstance().contactsFetchedOnce()) {
            ContactsManager.getInstance().enableContactsAccess();
            ContactsManager.getInstance().fetchContactsAsync();
        }

        mMainActivtityBinding.contentMain.pager.setAdapter(new CustomViewPagerAdapter(getSupportFragmentManager()));
        mMainActivtityBinding.tablayout.setupWithViewPager(mMainActivtityBinding.contentMain.pager);
        mMainActivtityBinding.fabCall.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, DialerActivity.class));
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

        LinphoneCore lc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();
        if (lc != null) {
            lc.addListener(mListener);
            if (!LinphoneService.instance().displayServiceNotification()) {
                lc.refreshRegisters();
            }
        }

        if (LinphoneManager.getLc().getCalls().length > 0) {
            LinphoneCall call = LinphoneManager.getLc().getCalls()[0];
            LinphoneCall.State callState = call.getState();

            if (callState == LinphoneCall.State.IncomingReceived) {
                startActivity(new Intent(this, DemoCallIncomingActivity.class));
            } else if (callState == LinphoneCall.State.OutgoingInit || callState == LinphoneCall.State.OutgoingProgress || callState == LinphoneCall.State.OutgoingRinging) {
                startActivity(new Intent(this, DemoCallOutGoingActivity.class));
            } else {
                startIncallActivity(call);
            }
        }
    }

    private void startIncallActivity(LinphoneCall call) {
        startActivity(new Intent(MainActivity.this, CallActivity.class));
    }

    @Override
    protected void onPause() {

        LinphoneCore lc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();
        if (lc != null) {
            lc.removeListener(mListener);
        }

        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    @Override
    public boolean onCreateOptionsMenu(final Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);

        MenuItem menuItem = menu.findItem(R.id.search);
        MenuItemCompat.setOnActionExpandListener(menuItem, new MenuItemCompat.OnActionExpandListener() {
            @Override
            public boolean onMenuItemActionExpand(MenuItem item) {
                item.getActionView().requestFocus();
                return true;
            }

            @Override
            public boolean onMenuItemActionCollapse(MenuItem item) {
                item.getActionView().clearFocus();
                return true;
            }
        });

        final SearchView mSearchView = ((SearchView) MenuItemCompat.getActionView(menu.findItem(R.id.search)));

        mSearchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                int current = mMainActivtityBinding.contentMain.pager.getCurrentItem();
                Fragment currentFragment = ((CustomViewPagerAdapter) mMainActivtityBinding.contentMain.pager.getAdapter()).getItem(current);
                if (currentFragment instanceof onSearchQuerylistener) {
                    ((onSearchQuerylistener) currentFragment).onSearchQuery(query);
                }

                return true;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                int current = mMainActivtityBinding.contentMain.pager.getCurrentItem();
                Fragment currentFragment = ((CustomViewPagerAdapter) mMainActivtityBinding.contentMain.pager.getAdapter()).getItem(current);
                if (currentFragment instanceof onSearchQuerylistener) {
                    ((onSearchQuerylistener) currentFragment).onSearchQuery(newText);
                }

                return true;
            }
        });

        mSearchView.setOnCloseListener(new SearchView.OnCloseListener() {
            @Override
            public boolean onClose() {

                if (mSearchView.getQuery().length() > 0) {
                    mSearchView.setQuery("", false);
                    mSearchView.setIconified(false);
                    mSearchView.clearFocus();
                    return true;
                }

                return false;
            }
        });

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.settings_main:

                navigateToFull(DemoSettingsFragment.newInstance(), android.R.id.content, true);

                break;
        }

        return super.onOptionsItemSelected(item);
    }

    public void startInCallOutGoingActivity(LinphoneContact contact) {
        AddressType address = new AddressText(this, null);

        for (LinphoneNumberOrAddress noa : contact.getNumbersOrAddresses()) {

            String value = noa.getValue();
            String displayednumberOrAddress = LinphoneUtils.getDisplayableUsernameFromAddress(value);

            LinphoneProxyConfig lpc = LinphoneManager.getLc().getDefaultProxyConfig();
            if (lpc != null) {
                String username = lpc.normalizePhoneNumber(displayednumberOrAddress);
                value = LinphoneUtils.getFullAddressFromUsername(username);
                address.setDisplayedName(value);
                address.setText(username);
                LinphoneManager.getInstance().newOutgoingCall(address);
            }

//            String contactAddress = contact.getPresenceModelForUri(noa.getValue());
//            if (contactAddress != null) {
//                address.setDisplayedName(contact.getFirstName());
//                address.setText(contactAddress);
//                LinphoneManager.getInstance().newOutgoingCall(address);
//            }
        }
    }


    public <T> void navigateToFull(Class<? extends Fragment> clazz, int resourceId, boolean allowOnBackStack) {

        FragmentManager fm = getSupportFragmentManager();
        FragmentTransaction ft = fm.beginTransaction();

        if (fm.findFragmentByTag(clazz.getSimpleName()) != null) {
            ft.replace(resourceId, Fragment.instantiate(this, clazz.getSimpleName()), clazz.getSimpleName());
        } else {
            ft.add(resourceId, Fragment.instantiate(this, clazz.getSimpleName()), clazz.getSimpleName());
        }

        if (allowOnBackStack) {
            ft.addToBackStack(null);
        }

        ft.commit();
    }

    public void navigateToFull(Fragment fragment, int resourceId, boolean allowOnBackStack) {
        FragmentManager fm = getSupportFragmentManager();
        FragmentTransaction ft = fm.beginTransaction();

        if (fm.findFragmentById(resourceId) != null) {
            ft.replace(resourceId, fragment);
        } else {
            ft.add(resourceId, fragment);
        }

        if (allowOnBackStack) {
            ft.addToBackStack(null);
        }

        ft.commit();
    }

    private class ServiceWaitThread extends Thread {
        public void run() {
            while (!LinphoneService.isReady()) {
                try {
                    sleep(30);
                } catch (InterruptedException e) {
                    throw new RuntimeException("waiting thread sleep() has been interrupted");
                }
            }
            mHandler.post(new Runnable() {
                @Override
                public void run() {
                    initUI();
                }
            });
            mServiceThread = null;
        }
    }
}
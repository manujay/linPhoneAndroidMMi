package com.mmi;

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

import com.mmi.adapter.CustomViewPagerAdapter;
import com.mmi.listener.onSearchQuerylistener;

import org.linphone.ContactsManager;
import org.linphone.LinphoneService;
import org.linphone.R;
import org.linphone.databinding.MainActivityBinding;
import org.linphone.mediastream.Log;

import static android.content.Intent.ACTION_MAIN;

/**
 * Created by ceinfo on 12/6/17.
 */

public class MainActivity extends AppCompatActivity implements onSearchQuerylistener {

    private static final int PERMISSIONS_REQUEST_SYNC = 207;
    private static final int PERMISSIONS_REQUEST_CONTACTS = 208;

    private MainActivityBinding mMainActivtityBinding;
    private Handler mHandler = new Handler();
    private ServiceWaitThread mServiceThread;

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
                startActivity(new Intent(MainActivity.this, DemoCallingActivity.class));
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);

        MenuItem item = menu.findItem(R.id.search);
        MenuItemCompat.setOnActionExpandListener(item, new MenuItemCompat.OnActionExpandListener() {
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

        ((SearchView) MenuItemCompat.getActionView(menu.findItem(R.id.search))).setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                if (!query.isEmpty()) {
                    int current = mMainActivtityBinding.contentMain.pager.getCurrentItem();
                    Fragment currentFragment = ((CustomViewPagerAdapter) mMainActivtityBinding.contentMain.pager.getAdapter()).getItem(current);
                    if (currentFragment instanceof onSearchQuerylistener) {
                        ((onSearchQuerylistener) currentFragment).onSearchQuery(query);
                    }

                    return true;
                }

                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                if (!newText.isEmpty()) {
                    int current = mMainActivtityBinding.contentMain.pager.getCurrentItem();
                    Fragment currentFragment = ((CustomViewPagerAdapter) mMainActivtityBinding.contentMain.pager.getAdapter()).getItem(current);
                    if (currentFragment instanceof onSearchQuerylistener) {
                        ((onSearchQuerylistener) currentFragment).onSearchQuery(newText);
                    }

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

                navigateToFull(SettingsFragment.newInstance(), android.R.id.content, true);

                break;
        }

        return super.onOptionsItemSelected(item);
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

    @Override
    public void onSearchQuery(String query) {

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
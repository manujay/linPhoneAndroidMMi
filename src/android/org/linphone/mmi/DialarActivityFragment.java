package org.linphone.mmi;

import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import org.linphone.R;
import org.linphone.core.LinphoneCore;
import org.linphone.mediastream.Log;
import org.linphone.mmi.listener.onAttachDialerListener;
import org.linphone.ui.AddressAware;
import org.linphone.ui.AddressText;
import org.linphone.ui.CallButton;
import org.linphone.ui.EraseButton;

/**
 * A placeholder fragment containing a simple view.
 */
public class DialarActivityFragment extends Fragment implements onAttachDialerListener {

    private static DialarActivityFragment instance;

    private AddressText mAddress;
    private CallButton mCall;
    private AddressAware numpad;
    private ImageView mAddContact;
    private View.OnClickListener addContactListener;
    private View.OnClickListener cancelListener;
    private View.OnClickListener transferListener;
    private boolean isCallTransferOngoing;
    private boolean shouldEmptyAddressField;

    public DialarActivityFragment() {
    }

    /**
     * @return null if not ready yet
     */
    public static DialarActivityFragment instance() {
        return instance;
    }

    @Override
    public void onAttachedDialer() {
        enableDisableAddContact();
    }

    @Override
    public void onUpdateDialer() {

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_dialar, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        mAddress = view.findViewById(R.id.address);
        mAddress.setOnAttachDialerListener(this);

        EraseButton erase = view.findViewById(R.id.erase);
        erase.setAddressWidget(mAddress);

        mCall = view.findViewById(R.id.call);
        mCall.setAddressWidget(mAddress);
//        if (LinphoneActivity.isInstanciated() && LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null && LinphoneManager.getLcIfManagerNotDestroyedOrNull().getCallsNb() > 0) {
//            if (isCallTransferOngoing) {
//                mCall.setImageResource(R.drawable.call_transfer);
//            } else {
//                mCall.setImageResource(R.drawable.call_add);
//            }
//        } else {
//            if (LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null && LinphoneManager.getLcIfManagerNotDestroyedOrNull().getVideoAutoInitiatePolicy()) {
//                mCall.setImageResource(R.drawable.call_video_start);
//            } else {
//                mCall.setImageResource(R.drawable.call_audio_start);
//            }
//        }

        numpad = view.findViewById(R.id.numpad);
        if (numpad != null) {
            numpad.setAddressWidget(mAddress);
        }

        mAddContact = view.findViewById(R.id.add_contact);
//        mAddContact.setEnabled(!(LinphoneActivity.isInstanciated() && LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null && LinphoneManager.getLc().getCallsNb() > 0));

        addContactListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                LinphoneActivity.instance().displayContactsForEdition(mAddress.getText().toString());
            }
        };
        cancelListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                LinphoneActivity.instance().resetClassicMenuLayoutAndGoBackToCallIfStillRunning();
            }
        };
        transferListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                LinphoneCore lc = LinphoneManager.getLc();
                if (lc.getCurrentCall() == null) {
                    return;
                }
                lc.transferCall(lc.getCurrentCall(), mAddress.getText().toString());
                isCallTransferOngoing = false;
//                LinphoneActivity.instance().resetClassicMenuLayoutAndGoBackToCallIfStillRunning();
            }
        };

        resetLayout(isCallTransferOngoing);

        if (getArguments() != null) {
            shouldEmptyAddressField = false;
            String number = getArguments().getString("SipUri");
            String displayName = getArguments().getString("DisplayName");
            String photo = getArguments().getString("PhotoUri");
            mAddress.setText(number);
            if (displayName != null) {
                mAddress.setDisplayedName(displayName);
            }
            if (photo != null) {
                mAddress.setPictureUri(Uri.parse(photo));
            }
        }

        instance = this;
    }

    @Override
    public void onResume() {
        super.onResume();
        instance = this;

//        if (LinphoneActivity.isInstanciated()) {
//            LinphoneActivity.instance().selectMenu(FragmentsAvailable.DIALER);
//            LinphoneActivity.instance().updateDialerFragment(null);
//            LinphoneActivity.instance().showStatusBar();
//            LinphoneActivity.instance().hideTabBar(false);
//        }

        boolean isOrientationLandscape = getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        if (isOrientationLandscape && !getResources().getBoolean(R.bool.isTablet)) {
            ((LinearLayout) numpad).setVisibility(View.GONE);
        } else {
            ((LinearLayout) numpad).setVisibility(View.VISIBLE);
        }

        if (shouldEmptyAddressField) {
            mAddress.setText("");
        } else {
            shouldEmptyAddressField = true;
        }
        resetLayout(isCallTransferOngoing);

//        String addressWaitingToBeCalled = LinphoneActivity.instance().mAddressWaitingToBeCalled;
//        if (addressWaitingToBeCalled != null) {
//            mAddress.setText(addressWaitingToBeCalled);
//            if (getResources().getBoolean(R.bool.automatically_start_intercepted_outgoing_gsm_call)) {
//                newOutgoingCall(addressWaitingToBeCalled);
//            }
//            LinphoneActivity.instance().mAddressWaitingToBeCalled = null;
//        }
    }

    @Override
    public void onPause() {
        instance = null;
        super.onPause();
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);


    }

    public void enableDisableAddContact() {
        mAddContact.setEnabled(LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null && LinphoneManager.getLc().getCallsNb() > 0 || !mAddress.getText().toString().equals(""));
    }

    public void resetLayout(boolean callTransfer) {
//        if (!LinphoneActivity.isInstanciated()) {
//            return;
//        }
//        isCallTransferOngoing = LinphoneActivity.instance().isCallTransfer();
        LinphoneCore lc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();
        if (lc == null) {
            return;
        }

        if (lc.getCallsNb() > 0) {
            if (isCallTransferOngoing) {
                mCall.setImageResource(R.drawable.call_transfer);
                mCall.setExternalClickListener(transferListener);
            } else {
                mCall.setImageResource(R.drawable.call_add);
                mCall.resetClickListener();
            }
            mAddContact.setEnabled(true);
            mAddContact.setImageResource(R.drawable.call_alt_back);
            mAddContact.setOnClickListener(cancelListener);
        } else {
            if (LinphoneManager.getLc().getVideoAutoInitiatePolicy()) {
                mCall.setImageResource(R.drawable.call_video_start);
            } else {
                mCall.setImageResource(R.drawable.call_audio_start);
            }
            mAddContact.setEnabled(false);
            mAddContact.setImageResource(R.drawable.contact_add_button);
            mAddContact.setOnClickListener(addContactListener);
            enableDisableAddContact();
        }
    }

    public void displayTextInAddressBar(String numberOrSipAddress) {
        shouldEmptyAddressField = false;
        mAddress.setText(numberOrSipAddress);
    }

    public void newOutgoingCall(String numberOrSipAddress) {
        displayTextInAddressBar(numberOrSipAddress);
        LinphoneManager.getInstance().newOutgoingCall(mAddress);
    }

    public void newOutgoingCall(Intent intent) {
        if (intent != null && intent.getData() != null) {
            String scheme = intent.getData().getScheme();
            if (scheme.startsWith("imto")) {
                mAddress.setText("sip:" + intent.getData().getLastPathSegment());
            } else if (scheme.startsWith("call") || scheme.startsWith("sip")) {
                mAddress.setText(intent.getData().getSchemeSpecificPart());
            } else {
                Uri contactUri = intent.getData();
                String address = ContactsManager.getAddressOrNumberForAndroidContact(LinphoneService.instance().getContentResolver(), contactUri);
                if (address != null) {
                    mAddress.setText(address);
                } else {
                    Log.e("Unknown scheme: ", scheme);
                    mAddress.setText(intent.getData().getSchemeSpecificPart());
                }
            }

            mAddress.clearDisplayedName();
            intent.setData(null);

            LinphoneManager.getInstance().newOutgoingCall(mAddress);
        }
    }
}

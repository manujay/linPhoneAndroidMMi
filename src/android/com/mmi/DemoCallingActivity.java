package com.mmi;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import org.linphone.AddressType;
import org.linphone.LinphoneManager;
import org.linphone.LinphonePreferences;
import org.linphone.LinphoneService;
import org.linphone.LinphoneUtils;
import org.linphone.R;
import org.linphone.StatusFragment;
import org.linphone.core.CallDirection;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallLog;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneCoreListenerBase;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.core.Reason;
import org.linphone.mediastream.Log;
import org.linphone.ui.AddressText;

import java.util.ArrayList;
import java.util.List;

import static android.content.Intent.ACTION_MAIN;

/**
 * Created by ceinfo on 11/25/17.
 */

public class DemoCallingActivity extends Activity {

    static DemoCallingActivity instance;
    private StatusFragment status;
    private AddressText editText;
    private LinphoneCall mCall;
    private Button mCallingButton;
    private Button mHangUpButton;
    private LinphoneCoreListenerBase mListener;
    private TextView textView;
    private Handler mHandler = new Handler();
    private ServiceWaitThread mServiceThread;


    static final boolean isInstanciated() {
        return instance != null;
    }

    public static final DemoCallingActivity instance() {
        if (instance != null)
            return instance;
        throw new RuntimeException("DemoCallingActivity not instantiated yet");
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_demo_calling_activity);
        /*
            You can now use your linphone account with these parameters:
            Sip identity : sip:jayman1989@sip.linphone.org
            Username : jayman1989
            Domain / Proxy : sip.linphone.org
        * */


        if (LinphoneService.isReady()) {

            initUI();

        } else {
            // start linphone as background
            startService(new Intent(ACTION_MAIN).setClass(this, LinphoneService.class));
            mServiceThread = new ServiceWaitThread();
            mServiceThread.start();
        }

        initUI();

        instance = this;

    }

    private void decline() {
        LinphoneManager.getLc().terminateCall(mCall);
//        finish();
    }

    public void displayCustomToast(final String message, final int duration) {
        ToastUtils.displayCustomToast(this, message, duration);
    }

    @Override
    protected void onResume() {
        super.onResume();
        instance = this;

        LinphoneCore lc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();
        if (lc != null) {
            lc.addListener(mListener);
        }

        mCall = null;

        // Only one call ringing at a time is allowed
        if (LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null) {
            List<LinphoneCall> calls = LinphoneUtils.getLinphoneCalls(LinphoneManager.getLc());
            for (LinphoneCall call : calls) {
                LinphoneCall.State cstate = call.getState();
                if (LinphoneCall.State.OutgoingInit == cstate || LinphoneCall.State.OutgoingProgress == cstate
                        || LinphoneCall.State.OutgoingRinging == cstate || LinphoneCall.State.OutgoingEarlyMedia == cstate) {
                    mCall = call;
                    break;
                }
            }
        }
    }

    public void updateStatusFragment(StatusFragment fragment) {
        status = fragment;
    }

    @Override
    protected void onStart() {
        super.onStart();
        checkAndRequestCallPermissions();
    }

    @Override
    protected void onPause() {
        LinphoneCore lc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();
        if (lc != null) {
            lc.removeListener(mListener);
        }
        super.onPause();
    }

    private String setText(boolean isCalling, AddressType s) {
        if (isCalling) {
            return "Calling... " + (s.getDisplayedName() != null && !s.getDisplayedName().isEmpty() ? s.getDisplayedName() : s.getText());
        } else {
            return "Hanging Up... " + (s.getDisplayedName() != null && !s.getDisplayedName().isEmpty() ? s.getDisplayedName() : s.getText());
        }
    }


    private void newOutGoingCall(AddressType s) {
        try {
            if (!LinphoneManager.getInstance().acceptCallIfIncomingPending()) {
                if (s.getText().length() > 0) {
                    LinphoneManager.getInstance().routeAudioToReceiver();
                    LinphoneManager.getInstance().setAudioManagerInCallMode();
                    LinphoneManager.getInstance().newOutgoingCall(s);
                } else {
                    if (LinphonePreferences.instance().isBisFeatureEnabled()) {
                        LinphoneCallLog[] logs = LinphoneManager.getLc().getCallLogs();
                        LinphoneCallLog log = null;
                        for (LinphoneCallLog l : logs) {
                            if (l.getDirection() == CallDirection.Outgoing) {
                                log = l;
                                break;
                            }
                        }
                        if (log == null) {
                            return;
                        }

                        LinphoneProxyConfig lpc = LinphoneManager.getLc().getDefaultProxyConfig();
                        if (lpc != null && log.getTo().getDomain().equals(lpc.getDomain())) {
                            textView.setText(log.getTo().getUserName());
                        } else {
                            textView.setText(log.getTo().asStringUriOnly());
                        }
                        textView.setText(log.getTo().getDisplayName());
                    }
                }
            }
        } catch (LinphoneCoreException e) {
            LinphoneManager.getInstance().terminateCall();
            onWrongDestinationAddress();
        }
    }

    protected void onWrongDestinationAddress() {
        Toast.makeText(this
                , String.format(getResources().getString(R.string.warning_wrong_destination_address), editText.getText().toString())
                , Toast.LENGTH_LONG).show();
    }

    private void hangUp() {
        LinphoneCore lc = LinphoneManager.getLc();
        LinphoneCall currentCall = lc.getCurrentCall();

        if (currentCall != null) {
            lc.terminateCall(currentCall);
        } else if (lc.isInConference()) {
            lc.terminateConference();
        } else {
            lc.terminateAllCalls();
        }
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (LinphoneManager.isInstanciated() && (keyCode == KeyEvent.KEYCODE_BACK || keyCode == KeyEvent.KEYCODE_HOME)) {
            LinphoneManager.getLc().terminateCall(mCall);
            finish();
        }
        return super.onKeyDown(keyCode, event);
    }

    private void checkAndRequestCallPermissions() {
        ArrayList<String> permissionsList = new ArrayList<String>();

        int recordAudio = getPackageManager().checkPermission(Manifest.permission.RECORD_AUDIO, getPackageName());
        Log.i("[Permission] Record audio permission is " + (recordAudio == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));
        int camera = getPackageManager().checkPermission(Manifest.permission.CAMERA, getPackageName());
        Log.i("[Permission] Camera permission is " + (camera == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));

        if (recordAudio != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.RECORD_AUDIO)) {
                Log.i("[Permission] Asking for record audio");
                permissionsList.add(Manifest.permission.RECORD_AUDIO);
            }
        }
//        if (LinphonePreferences.instance().shouldInitiateVideoCall() || LinphonePreferences.instance().shouldAutomaticallyAcceptVideoRequests()) {
        if (camera != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA)) {
                Log.i("[Permission] Asking for camera");
                permissionsList.add(Manifest.permission.CAMERA);
            }
        }
//        }

        if (permissionsList.size() > 0) {
            String[] permissions = new String[permissionsList.size()];
            permissions = permissionsList.toArray(permissions);
            ActivityCompat.requestPermissions(this, permissions, 0);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        for (int i = 0; i < permissions.length; i++) {
            Log.i("[Permission] " + permissions[i] + " is " + (grantResults[i] == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));
        }
    }

    private void initUI() {
        editText = findViewById(R.id.addresss_ca);
        mCallingButton = findViewById(R.id.callButton_ca);
        mHangUpButton = findViewById(R.id.hangButton_ca);
        textView = findViewById(R.id.textViewWrapper);

        mCallingButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!mHangUpButton.isEnabled()) {
                    mHangUpButton.setEnabled(true);
                    mCallingButton.setEnabled(false);
                } else {
                    mHangUpButton.setEnabled(false);
                    mCallingButton.setEnabled(true);
                }

                textView.setText(setText(true, editText));
                newOutGoingCall(editText);
            }
        });

        mHangUpButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!mCallingButton.isEnabled()) {
                    mCallingButton.setEnabled(true);
                    mHangUpButton.setEnabled(false);
                } else {
                    mCallingButton.setEnabled(false);
                    mHangUpButton.setEnabled(true);
                }
                textView.setText(setText(false, editText));
                hangUp();
            }
        });


        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (mCallingButton.isEnabled()) {
                    mCallingButton.setText("Call");
                }

                if (!TextUtils.isEmpty(charSequence) && charSequence.length() > 0) {
                    mCallingButton.setEnabled(true);
                } else {
                    mCallingButton.setEnabled(false);
                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        mListener = new LinphoneCoreListenerBase() {
            @Override
            public void callState(LinphoneCore lc, LinphoneCall call, LinphoneCall.State state, String message) {
                if (call == mCall && LinphoneCall.State.Connected == state) {
                    if (!DemoCallingActivity.isInstanciated()) {
                        return;
                    }

                    LinphoneManager.getInstance().setAudioManagerInCallMode();

                    if (!mCallingButton.isEnabled()) {
                        textView.setText(setText(true, editText));
                    }


                    return;
                } else if (state == LinphoneCall.State.Error) {
                    // Convert LinphoneCore message for internalization
                    if (call.getErrorInfo().getReason() == Reason.Declined) {
                        displayCustomToast(getString(R.string.error_call_declined), Toast.LENGTH_SHORT);
                        decline();
                    } else if (call.getErrorInfo().getReason() == Reason.NotFound) {
                        displayCustomToast(getString(R.string.error_user_not_found), Toast.LENGTH_SHORT);
                        decline();
                    } else if (call.getErrorInfo().getReason() == Reason.Media) {
                        displayCustomToast(getString(R.string.error_incompatible_media), Toast.LENGTH_SHORT);
                        decline();
                    } else if (call.getErrorInfo().getReason() == Reason.Busy) {
                        displayCustomToast(getString(R.string.error_user_busy), Toast.LENGTH_SHORT);
                        decline();
                    } else if (message != null) {
                        displayCustomToast(getString(R.string.error_unknown) + " - " + message, Toast.LENGTH_SHORT);
                        decline();
                    }

                    resetUI();

                } else if (state == LinphoneCall.State.CallEnd) {
                    // Convert LinphoneCore message for internalization
                    if (call.getErrorInfo().getReason() == Reason.Declined) {
                        displayCustomToast(getString(R.string.error_call_declined), Toast.LENGTH_SHORT);
                        decline();
                    }

                    resetUI();
                }

//                if (LinphoneManager.getLc().getCallsNb() == 0) {
//                    finish();
//                    return;
//                }
            }

            @Override
            public void callEncryptionChanged(LinphoneCore lc, LinphoneCall call, boolean encrypted, String authenticationToken) {
                if (status != null) {
                    if (call.getCurrentParams().getMediaEncryption().equals(LinphoneCore.MediaEncryption.ZRTP) && !call.isAuthenticationTokenVerified()) {
                        status.showZRTPDialog(call);
                    }
                    status.refreshStatusItems(call, call.getCurrentParams().getVideoEnabled());
                }
            }
        };
    }

    private void resetUI() {
        if (!mCallingButton.isEnabled()) {
            mCallingButton.setEnabled(true);
            mHangUpButton.setEnabled(false);
        }
        textView.setText("");
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
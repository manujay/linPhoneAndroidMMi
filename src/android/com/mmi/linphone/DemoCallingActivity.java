package com.mmi.linphone;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import org.linphone.AddressType;
import org.linphone.LinphoneManager;
import org.linphone.LinphonePreferences;
import org.linphone.LinphoneService;
import org.linphone.R;
import org.linphone.core.CallDirection;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallLog;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.mediastream.Log;
import org.linphone.ui.AddressText;

import java.util.ArrayList;

import static android.content.Intent.ACTION_MAIN;

/**
 * Created by ceinfo on 11/25/17.
 */

public class DemoCallingActivity extends Activity {

    private AddressText editText;
    private Button button;


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
        startService(new Intent(ACTION_MAIN).setClass(this, LinphoneService.class));

        editText = (AddressText) findViewById(R.id.addresss_ca);
        button = (Button) findViewById(R.id.callingButton_ca);

        button.setOnClickListener(new View.OnClickListener() {

            boolean isCalling = true;

            @Override
            public void onClick(View view) {

                if (isCalling) {
                    checkAndRequestCallPermissions();
                    newOutGoingCall(editText);
                } else {
                    hangUp();
                }

                button.setText(setText(isCalling, editText));

                toggelMicro(isCalling);

                isCalling = !isCalling;

            }
        });

        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (button.isEnabled()) {
                    button.setText("Call");
                }

                if (!TextUtils.isEmpty(charSequence) && charSequence.length() > 0) {
                    button.setEnabled(true);
                } else {
                    button.setEnabled(false);
                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
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
                            button.setText(log.getTo().getUserName());
                        } else {
                            button.setText(log.getTo().asStringUriOnly());
                        }
                        button.setText(log.getTo().getDisplayName());
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

    private void toggelMicro(boolean isMicMuted) {

        isMicMuted = !isMicMuted;

        LinphoneCore lc = LinphoneManager.getLc();
        lc.muteMic(isMicMuted);
    }

    private void checkAndRequestCallPermissions() {
        ArrayList<String> permissionsList = new ArrayList<String>();

        int recordAudio = getPackageManager().checkPermission(Manifest.permission.RECORD_AUDIO, getPackageName());
        Log.i("[Permission] Record audio permission is " + (recordAudio == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));
        int camera = getPackageManager().checkPermission(Manifest.permission.CAMERA, getPackageName());
        Log.i("[Permission] Camera permission is " + (camera == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));

        if (recordAudio != PackageManager.PERMISSION_GRANTED) {
            if (LinphonePreferences.instance().firstTimeAskingForPermission(Manifest.permission.RECORD_AUDIO) || ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.RECORD_AUDIO)) {
                Log.i("[Permission] Asking for record audio");
                permissionsList.add(Manifest.permission.RECORD_AUDIO);
            }
        }
        if (LinphonePreferences.instance().shouldInitiateVideoCall() || LinphonePreferences.instance().shouldAutomaticallyAcceptVideoRequests()) {
            if (camera != PackageManager.PERMISSION_GRANTED) {
                if (LinphonePreferences.instance().firstTimeAskingForPermission(Manifest.permission.CAMERA) || ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA)) {
                    Log.i("[Permission] Asking for camera");
                    permissionsList.add(Manifest.permission.CAMERA);
                }
            }
        }

        if (permissionsList.size() > 0) {
            String[] permissions = new String[permissionsList.size()];
            permissions = permissionsList.toArray(permissions);
            ActivityCompat.requestPermissions(this, permissions, 0);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        for (int i = 0; i < permissions.length; i++) {
            Log.i("[Permission] " + permissions[i] + " is " + (grantResults[i] == PackageManager.PERMISSION_GRANTED ? "granted" : "denied"));
        }
    }
}
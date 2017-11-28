package com.mmi.linphone;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.widget.ImageView;

import org.linphone.LinphoneManager;
import org.linphone.LinphonePreferences;
import org.linphone.LinphoneUtils;
import org.linphone.R;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreListenerBase;
import org.linphone.mediastream.Log;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ceinfo on 11/28/17.
 */

public class DemoCallIncomingActivity extends MmiLinPhoneGenericActivity {


    LinphoneCoreListenerBase mListener;
    ImageView accept, Decline;
    private LinphoneCall mCall;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.democallincoming_activity);


        initUi();

        lookupCurrentCall();

        mListener = new LinphoneCoreListenerBase() {
            @Override
            public void callState(LinphoneCore lc, LinphoneCall call, LinphoneCall.State state, String message) {
                super.callState(lc, call, state, message);

                if (call == mCall && LinphoneCall.State.CallEnd == state) {
                    finish();
                }
                if (state == LinphoneCall.State.StreamsRunning) {
                    Log.e("CallIncommingActivity - onCreate -  State.StreamsRunning - speaker = " + LinphoneManager.getLc().isSpeakerEnabled());
                    // The following should not be needed except some devices need it (e.g. Galaxy S).
                    LinphoneManager.getLc().enableSpeaker(LinphoneManager.getLc().isSpeakerEnabled());
                }

            }
        };

    }

    private void lookupCurrentCall() {
        if (LinphoneManager.getLcIfManagerNotDestroyedOrNull() != null) {
            List<LinphoneCall> calls = LinphoneUtils.getLinphoneCalls(LinphoneManager.getLc());
            for (LinphoneCall call : calls) {
                if (LinphoneCall.State.IncomingReceived == call.getState()) {
                    mCall = call;
                    break;
                }
            }
        }
    }

    private void initUi() {
        accept = findViewById(R.id.accept);
        Decline = findViewById(R.id.decline);
    }


    @Override
    protected void onResume() {
        super.onResume();

        checkAndRequestCallPermissions();

        LinphoneCore lpc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();

        if (null != lpc) {
            lpc.addListener(mListener);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        LinphoneCore lpc = LinphoneManager.getLcIfManagerNotDestroyedOrNull();

        if (null != lpc) {
            lpc.removeListener(mListener);
        }

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

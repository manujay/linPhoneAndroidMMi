package com.mmi.linphone;

import android.os.Bundle;
import android.widget.ImageView;

import org.linphone.LinphoneManager;
import org.linphone.LinphoneUtils;
import org.linphone.R;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreListenerBase;
import org.linphone.mediastream.Log;

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
}

package org.linphone;

import android.os.Bundle;
import android.support.annotation.Nullable;

import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreListenerBase;

/**
 * Created by ceinfo on 11/28/17.
 */

public class DemoCallOutGoingActivity extends MmiLinPhoneGenericActivity {


    private static DemoCallOutGoingActivity instance;
    private LinphoneCall mCall;
    private LinphoneCoreListenerBase mListener;
    private boolean isMicMuted, isSpeakerEnabled;

    public DemoCallOutGoingActivity instance() {
        return instance;
    }

    public boolean isInstanciated() {
        return null != instance;
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.democalloutgoing_activity);


        mListener = new LinphoneCoreListenerBase() {
            @Override
            public void callState(LinphoneCore lc, LinphoneCall call, LinphoneCall.State state, String message) {
                if (null == call && state == LinphoneCall.State.Connected) {

                    LinphoneActivity.instance().startIncallActivity(mCall);

                    finish();

                    return;

                } else if (state == LinphoneCall.State.Error) {


                } else if (state == LinphoneCall.State.CallEnd) {


                }
            }
        };
    }
}

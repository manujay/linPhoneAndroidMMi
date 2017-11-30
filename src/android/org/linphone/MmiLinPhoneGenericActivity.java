package org.linphone;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;

/**
 * Created by ceinfo on 11/28/17.
 */

public class MmiLinPhoneGenericActivity extends Activity {


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        /*After a crash, Android restart the last Activity so we need to check
        * if all dependencies are load
        */
        if (!LinphoneService.isReady()) {
            finish();
            startService(getIntent().setClass(this, LinphoneService.class));
            return;
        }
//        if (!LinphoneManager.isInstanciated()) {
//            finish();
//            startActivity(getIntent().setClass(this, LinphoneLauncherActivity.class));
//            return;
//        }
    }
}

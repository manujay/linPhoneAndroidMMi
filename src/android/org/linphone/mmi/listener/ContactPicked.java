package org.linphone.mmi.listener;

import android.net.Uri;

/**
 * Created by ceinfo on 12/13/17.
 */
public interface ContactPicked {
    void setAddresGoToDialerAndCall(String number, String name, Uri photo);
}

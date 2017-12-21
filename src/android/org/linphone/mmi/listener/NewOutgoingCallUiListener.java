package org.linphone.mmi.listener;

/**
 * Created by ceinfo on 11/25/17.
 */
public interface NewOutgoingCallUiListener {
    void onWrongDestinationAddress();

    void onCannotGetCallParameters();

    void onAlreadyInCall();
}

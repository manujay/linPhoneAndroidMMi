package org.linphone;

/**
 * Created by ceinfo on 11/25/17.
 */
public interface NewOutgoingCallUiListener {
    public void onWrongDestinationAddress();

    public void onCannotGetCallParameters();

    public void onAlreadyInCall();
}

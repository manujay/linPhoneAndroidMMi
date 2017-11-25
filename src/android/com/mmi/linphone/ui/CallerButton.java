package com.mmi.linphone.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import org.linphone.LinphoneManager;
import org.linphone.LinphonePreferences;
import org.linphone.R;
import org.linphone.core.CallDirection;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallLog;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.ui.AddressText;

/**
 * Created by ceinfo on 11/25/17.
 */

public class CallerButton extends Button implements View.OnClickListener {

    private boolean isCalling = true;
    private AddressText mAddress;

    public CallerButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        setOnClickListener(this);
    }

    public void setExternalClickListener(OnClickListener e) {
        setOnClickListener(e);
    }

    public void resetClickListener() {
        setOnClickListener(this);
    }

    public void setAddressWidget(AddressText a) {
        mAddress = a;
    }

    @Override
    public void onClick(View view) {

        if (isCalling) {
            try {
                if (!LinphoneManager.getInstance().acceptCallIfIncomingPending()) {
                    if (mAddress.getText().length() > 0) {
                        setText("Calling... " + (mAddress.getDisplayedName() != null && !mAddress.getDisplayedName().isEmpty() ? mAddress.getDisplayedName() : mAddress.getText()));
                        LinphoneManager.getInstance().newOutgoingCall(mAddress);
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
                                mAddress.setText(log.getTo().getUserName());
                            } else {
                                mAddress.setText(log.getTo().asStringUriOnly());
                            }
                            mAddress.setSelection(mAddress.getText().toString().length());
                            mAddress.setDisplayedName(log.getTo().getDisplayName());
                        }
                    }
                }
            } catch (LinphoneCoreException e) {
                LinphoneManager.getInstance().terminateCall();
                onWrongDestinationAddress();
            }
        } else {
            setText("Hanging Up... " + (mAddress.getDisplayedName() != null && !mAddress.getDisplayedName().isEmpty() ? mAddress.getDisplayedName() : mAddress.getText()));
            hangUp();
        }

        isCalling = !isCalling;

    }

    protected void onWrongDestinationAddress() {
        Toast.makeText(getContext()
                , String.format(getResources().getString(R.string.warning_wrong_destination_address), mAddress.getText().toString())
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
}

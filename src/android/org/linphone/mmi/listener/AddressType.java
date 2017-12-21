package org.linphone.mmi.listener;

/**
 * Created by ceinfo on 11/25/17.
 */
public interface AddressType {
    CharSequence getText();

    void setText(CharSequence s);

    String getDisplayedName();

    void setDisplayedName(String s);
}

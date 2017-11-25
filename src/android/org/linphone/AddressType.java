package org.linphone;

/**
 * Created by ceinfo on 11/25/17.
 */
public interface AddressType {
    void setText(CharSequence s);

    CharSequence getText();

    void setDisplayedName(String s);

    String getDisplayedName();
}

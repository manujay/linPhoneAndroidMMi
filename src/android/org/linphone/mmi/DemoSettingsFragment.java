package org.linphone.mmi;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import org.linphone.R;
import org.linphone.databinding.SettingsLayoutBinding;

/**
 * Created by ceinfo on 12/6/17.
 */

public class DemoSettingsFragment extends Fragment {

    public static final CharSequence TITLE = "Settings";
    private SettingsLayoutBinding mSettingsBinding;

    public DemoSettingsFragment() {
        //Empty Constructor
    }

    public static DemoSettingsFragment newInstance() {

        Bundle args = new Bundle();

        DemoSettingsFragment fragment = new DemoSettingsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        mSettingsBinding = SettingsLayoutBinding.inflate(inflater, container, false);
        return mSettingsBinding.getRoot();
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        mSettingsBinding.settingsToolbar.setTitle(R.string._settings);
        mSettingsBinding.settingsToolbar.setNavigationIcon(R.drawable.ic_arrow_back_white_24px);
        mSettingsBinding.settingsToolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                goBack();
            }
        });
    }

    private void goBack() {
        if (isVisible() && getActivity() != null) {
            getActivity().onBackPressed();
        }
    }
}

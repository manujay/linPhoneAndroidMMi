package com.mmi;

import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mmi.adapter.ContactRecyclerAdapter;
import com.mmi.listener.onSearchQuerylistener;

import org.linphone.ContactsManager;
import org.linphone.ContactsUpdatedListener;
import org.linphone.LinphoneContact;
import org.linphone.databinding.LayoutFragmentHistoryBinding;

/**
 * Created by ceinfo on 12/6/17.
 */

public class HistoryCallFragment extends Fragment implements ContactsUpdatedListener, onSearchQuerylistener {

    public static final CharSequence TITLE = "History";
    private LayoutFragmentHistoryBinding mLayoutHistoryBinding;

    public static HistoryCallFragment newInstance() {

        Bundle args = new Bundle();

        HistoryCallFragment fragment = new HistoryCallFragment();
        fragment.setArguments(args);
        return fragment;
    }

    private void showHideProgress(boolean showHide) {
        if (showHide) {
            if (mLayoutHistoryBinding.contactFetchprogress.getVisibility() == View.GONE) {
                mLayoutHistoryBinding.contactFetchprogress.setVisibility(View.VISIBLE);
            }
        } else {
            if (mLayoutHistoryBinding.contactFetchprogress.getVisibility() == View.VISIBLE) {
                mLayoutHistoryBinding.contactFetchprogress.setVisibility(View.GONE);
            }
        }
    }

    @Override
    public void onContactsUpdated() {
        ContactRecyclerAdapter adapter = (ContactRecyclerAdapter) mLayoutHistoryBinding.callersRcv.getAdapter();
        if (adapter != null) {
            adapter.updateContactSet(ContactsManager.getInstance().getSIPContacts());
            showHideProgress(false);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return LayoutFragmentHistoryBinding.inflate(inflater, container, false).getRoot();

    }

    @Override
    public void onResume() {
        ContactsManager.addContactsListener(this);
        super.onResume();
    }

    @Override
    public void onPause() {
        ContactsManager.removeContactsListener(this);
        super.onPause();
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        initUI(view);
    }

    private void initUI(View view) {
        mLayoutHistoryBinding = DataBindingUtil.getBinding(view);
        mLayoutHistoryBinding.callersRcv.setLayoutManager(new LinearLayoutManager(getContext(), LinearLayoutManager.VERTICAL, false));
        mLayoutHistoryBinding.callersRcv.addItemDecoration(new DividerItemDecoration(getContext(), DividerItemDecoration.VERTICAL));
        mLayoutHistoryBinding.callersRcv.setAdapter(new ContactRecyclerAdapter(ContactsManager.getInstance().getSIPContacts()));
        mLayoutHistoryBinding.callersRcv.setHasFixedSize(true);
        ((ContactRecyclerAdapter) mLayoutHistoryBinding.callersRcv.getAdapter()).setOnLinphonContactClickListener(new ContactRecyclerAdapter.OnLinphonContactClickListener() {
            @Override
            public void onLinphoneContactClicked(LinphoneContact contact) {
                if (null != getActivity()) {
                    ((MainActivity) getActivity()).startInCallOutGoingActivity(contact);
                }
            }
        });
        showHideProgress(true);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public void onSearchQuery(String query) {
        if (isVisible() && !isHidden()) {
            ((ContactRecyclerAdapter) mLayoutHistoryBinding.callersRcv.getAdapter()).getFilter().filter(query);
        }
    }
}
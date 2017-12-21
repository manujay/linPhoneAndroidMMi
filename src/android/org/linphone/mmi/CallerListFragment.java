package org.linphone.mmi;

import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import org.linphone.databinding.FragmentLayoutCallersBinding;
import org.linphone.mmi.adapter.ContactRecyclerAdapter;
import org.linphone.mmi.listener.ContactsUpdatedListener;
import org.linphone.mmi.listener.onSearchQuerylistener;

/**
 * Created by ceinfo on 12/6/17.
 */

public class CallerListFragment extends Fragment implements ContactsUpdatedListener, onSearchQuerylistener {

    public static final CharSequence TITLE = "Accounts";
    private FragmentLayoutCallersBinding mFragmentCallersBindind;

    public static CallerListFragment newInstance() {

        Bundle args = new Bundle();

        CallerListFragment fragment = new CallerListFragment();
        fragment.setArguments(args);
        return fragment;
    }

    private void showHideProgress(boolean showHide) {
        if (showHide) {
            if (mFragmentCallersBindind.contactFetchprogress.getVisibility() == View.GONE) {
                mFragmentCallersBindind.contactFetchprogress.setVisibility(View.VISIBLE);
            }
        } else {
            if (mFragmentCallersBindind.contactFetchprogress.getVisibility() == View.VISIBLE) {
                mFragmentCallersBindind.contactFetchprogress.setVisibility(View.GONE);
            }
        }
    }

    @Override
    public void onContactsUpdated() {
        ContactRecyclerAdapter adapter = (ContactRecyclerAdapter) mFragmentCallersBindind.contactsRcv.getAdapter();
        if (adapter != null) {
            adapter.updateContactSet(ContactsManager.getInstance().getContacts());
            showHideProgress(false);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return FragmentLayoutCallersBinding.inflate(inflater, container, false).getRoot();
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

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    private void initUI(View view) {
        mFragmentCallersBindind = DataBindingUtil.getBinding(view);
        mFragmentCallersBindind.contactsRcv.setLayoutManager(new LinearLayoutManager(getContext(), LinearLayoutManager.VERTICAL, false));
        mFragmentCallersBindind.contactsRcv.addItemDecoration(new DividerItemDecoration(getContext(), LinearLayoutManager.VERTICAL));
        mFragmentCallersBindind.contactsRcv.setAdapter(new ContactRecyclerAdapter(ContactsManager.getInstance().getContacts()));
        mFragmentCallersBindind.contactsRcv.setHasFixedSize(true);
        mFragmentCallersBindind.executePendingBindings();
        ((ContactRecyclerAdapter) mFragmentCallersBindind.contactsRcv.getAdapter()).setOnLinphonContactClickListener(new ContactRecyclerAdapter.OnLinphonContactClickListener() {
            @Override
            public void onLinphoneContactClicked(LinphoneContact contact) {
                if (getActivity() != null) {
                    ((MainActivity) getActivity()).startInCallOutGoingActivity(contact);
                }
            }
        });
        showHideProgress(true);
    }

    @Override
    public void onSearchQuery(String query) {
        if (isVisible() && !isHidden()) {
            ((ContactRecyclerAdapter) mFragmentCallersBindind.contactsRcv.getAdapter()).getFilter().filter(query);
        }
    }
}
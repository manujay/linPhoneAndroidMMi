package com.mmi.adapter;

import android.databinding.DataBindingUtil;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.SectionIndexer;

import org.linphone.ContactsManager;
import org.linphone.LinphoneContact;
import org.linphone.databinding.SectionContactBinding;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

/**
 * Created by ceinfo on 12/7/17.
 */
public class ContactRecyclerAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> implements SectionIndexer, Filterable {

    private String[] sections;
    private ArrayList<String> sectionsList;
    private LinkedHashMap<String, Integer> map;
    private List<LinphoneContact> contacts;

    public ContactRecyclerAdapter(List<LinphoneContact> contactList) {
        updateContactSet(contactList);
    }

    public void updateContactSet(List<LinphoneContact> contactList) {
        contacts = contactList;

        map = new LinkedHashMap<String, Integer>();
        String prevLetter = null;
        for (int i = 0; i < contacts.size(); i++) {
            LinphoneContact contact = contacts.get(i);
            String fullName = contact.getFullName();
            if (fullName == null || fullName.isEmpty()) {
                continue;
            }
            String firstLetter = fullName.substring(0, 1).toUpperCase(Locale.getDefault());
            if (!firstLetter.equals(prevLetter)) {
                prevLetter = firstLetter;
                map.put(firstLetter, i);
            }
        }
        sectionsList = new ArrayList<String>(map.keySet());
        sections = new String[sectionsList.size()];
        sectionsList.toArray(sections);

        notifyDataSetChanged();
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        SectionContactBinding mBinding = SectionContactBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
        return new ContactViewHolder(mBinding.getRoot());
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {

        LinphoneContact contact = contacts.get(position);

        if (contact.isInLinphoneFriendList()) {
            ((ContactViewHolder) holder).mBinding.linphoneContactIv.setVisibility(View.VISIBLE);
        } else {
            ((ContactViewHolder) holder).mBinding.linphoneContactIv.setVisibility(View.GONE);
        }

        ((ContactViewHolder) holder).mBinding.contactHeaderBottom.setText("@" + contact.getOrganization());
        ((ContactViewHolder) holder).mBinding.contactHeaderMain.setText(contact.getFullName());
        ((ContactViewHolder) holder).mBinding.contactIv.setImageURI(contact.getThumbnailUri());
        ((ContactViewHolder) holder).mBinding.executePendingBindings();

    }

    @Override
    public int getItemCount() {
        return null != contacts && contacts.size() > 0 ? contacts.size() : 0;
    }

    @Override
    public Object[] getSections() {
        return sections;
    }

    @Override
    public int getPositionForSection(int sectionIndex) {
        if (sectionIndex >= sections.length || sectionIndex < 0) {
            return 0;
        }
        return map.get(sections[sectionIndex]);
    }

    @Override
    public int getSectionForPosition(int position) {
        if (position >= contacts.size() || position < 0) {
            return 0;
        }
        LinphoneContact contact = contacts.get(position);
        String fullName = contact.getFullName();
        if (fullName == null || fullName.isEmpty()) {
            return 0;
        }
        String letter = fullName.substring(0, 1).toUpperCase(Locale.getDefault());
        return sectionsList.indexOf(letter);
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                ArrayList<LinphoneContact> temp;
                FilterResults results = new FilterResults();
                if (null == constraint || constraint.length() == 0) {
                    results.values = contacts;
                    results.count = contacts.size();
                } else {
                    temp = new ArrayList<>(ContactsManager.getInstance().getContacts(constraint.toString()));
                    results.values = temp;
                    results.count = temp.size();
                }
                return results;
            }

            @SuppressWarnings("Unchecked")
            @Override
            protected void publishResults(CharSequence constraint, FilterResults results) {
                updateContactSet((ArrayList<LinphoneContact>) results.values);
            }
        };
    }

    private class ContactViewHolder extends RecyclerView.ViewHolder {

        SectionContactBinding mBinding;

        public ContactViewHolder(View itemView) {
            super(itemView);
            this.mBinding = DataBindingUtil.getBinding(itemView);
        }
    }
}

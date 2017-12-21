package org.linphone.mmi.adapter;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import org.linphone.mmi.CallerListFragment;
import org.linphone.mmi.HistoryCallFragment;

import java.util.Vector;

/**
 * Created by ceinfo on 12/6/17.
 */
public class CustomViewPagerAdapter extends FragmentStatePagerAdapter {

    private static Vector<Fragment> mFragmentVector = new Vector<>();

    public CustomViewPagerAdapter(FragmentManager fm) {
        super(fm);
        mFragmentVector.add(HistoryCallFragment.newInstance());
        mFragmentVector.add(CallerListFragment.newInstance());
    }

    @Override
    public Fragment getItem(int position) {
        return mFragmentVector.get(position);
    }

    @Override
    public int getCount() {
        return mFragmentVector.size();
    }

    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return HistoryCallFragment.TITLE;

            case 1:
                return CallerListFragment.TITLE;

        }
        return super.getPageTitle(position);
    }
}
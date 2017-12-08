package com.mmi.adapter;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.mmi.CallerListFragment;
import com.mmi.HistoryCallFragment;

/**
 * Created by ceinfo on 12/6/17.
 */
public class CustomViewPagerAdapter extends FragmentStatePagerAdapter {

    private static int TAB_COUNT = 2;

    public CustomViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {

        switch (position) {
            case 0:
                return HistoryCallFragment.newInstance();
            case 1:
                return CallerListFragment.newInstance();
        }
        return null;
    }

    @Override
    public int getCount() {
        return TAB_COUNT;
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
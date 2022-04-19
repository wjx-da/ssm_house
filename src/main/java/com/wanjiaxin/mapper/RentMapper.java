package com.wanjiaxin.mapper;

import com.wanjiaxin.po.PriceRange;
import com.wanjiaxin.po.Rent;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface RentMapper {
    Rent queryRent(Integer hourseId);

    void addRent(Rent rent)throws Exception;

    ArrayList<Rent> queryRent1(String where, int startIndex, int rows);

    int queryRentCount(String where);

    List<Rent> queryRentList(String where);

    boolean delete(int id);
}

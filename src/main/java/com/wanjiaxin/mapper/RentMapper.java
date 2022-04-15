package com.wanjiaxin.mapper;

import com.wanjiaxin.po.Rent;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentMapper {
    Rent queryRent(Integer hourseId);

    void addRent(Rent rent)throws Exception;
}

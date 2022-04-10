package com.chengxusheji.mapper;

import com.chengxusheji.po.Rent;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentMapper {
    Rent queryRent(Integer hourseId);

    void addRent(Rent rent)throws Exception;
}

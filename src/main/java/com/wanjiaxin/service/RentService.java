package com.wanjiaxin.service;

import com.wanjiaxin.mapper.RentMapper;
import com.wanjiaxin.po.Rent;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 1035
 */
@Service
public class RentService {
    @Resource
    RentMapper rentMapper;

    public Rent queryRent(Integer hourseId) {
        return rentMapper.queryRent(hourseId);
    }

    public void addRent(Rent rent) throws Exception{
        rentMapper.addRent(rent);
    }
}

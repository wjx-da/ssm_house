package com.wanjiaxin.service;

import com.wanjiaxin.mapper.RentMapper;
import com.wanjiaxin.po.PriceRange;
import com.wanjiaxin.po.Rent;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 1035
 */
@Service
public class RentService {
    @Resource
    RentMapper rentMapper;
    /*每页显示记录数目*/
    private int rows = 10;

    public int getRows() {
        return rows;
    }
    public void setRows(int rows) {
        this.rows = rows;
    }
    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }
    public Rent queryRent(Integer hourseId) {
        return rentMapper.queryRent(hourseId);
    }

    public void addRent(Rent rent) throws Exception{
        rentMapper.addRent(rent);
    }
    /*按照查询条件分页查询租金范围记录*/
    public ArrayList<Rent> queryRent1(int currentPage) throws Exception {
        String where = "where 1=1";
        int startIndex = (currentPage-1) * this.rows;
        return rentMapper.queryRent1(where, startIndex, this.rows);
    }
    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber() throws Exception {
        String where = "where 1=1";
        recordNumber = rentMapper.queryRentCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) {
            totalPage++;
        }
    }

    public List<Rent> queryRentRange() {
        String where = "where 1=1";
        return rentMapper.queryRentList(where);
    }

    public boolean delete(int id) {
      return  rentMapper.delete(id);
    }
}

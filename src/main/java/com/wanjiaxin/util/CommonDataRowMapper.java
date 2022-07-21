package com.wanjiaxin.util;

/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.JdbcUtils;
import org.springframework.lang.Nullable;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 * 方便jdbctemplate 查询返回 commonData对象
 * chenyouliang
 */
public class CommonDataRowMapper implements RowMapper<CommonData> {

    /**
     * 实例对象
     */
    private static  CommonDataRowMapper instance = null;

    /**
     * 私有构造方法
     */
    private CommonDataRowMapper(){};



    /**
     *  获取实例
     * @return
     */
    public static CommonDataRowMapper getInstance(){
        if (instance == null){
            synchronized(CommonDataRowMapper.class) {
                if (instance == null){
                    instance = new CommonDataRowMapper();
                }
            }
        }
        return instance;
    }

    @Override
    public CommonData mapRow(ResultSet rs, int rowNum) throws SQLException {
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        CommonData mapOfColumnValues = new CommonData();

        for(int i = 1; i <= columnCount; ++i) {
            String column = JdbcUtils.lookupColumnName(rsmd, i);
            mapOfColumnValues.putIfAbsent(this.getColumnKey(column), this.getColumnValue(rs, i));
        }

        return mapOfColumnValues;
    }
    protected String getColumnKey(String columnName) {
        return columnName;
    }

    @Nullable
    protected Object getColumnValue(ResultSet rs, int index) throws SQLException {
        return JdbcUtils.getResultSetValue(rs, index);
    }
}

package com.wanjiaxin.util;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */
@Repository
public class CommonDao<T> {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private CommonDataRowMapper rowMapper = CommonDataRowMapper.getInstance();

    /**
     * 查询list
     * 返回  List<CommonData>
     *
     * @param sql
     * @return
     */
    public List<CommonData> list(String sql) {
        System.out.println(">>>>>>>>>>>>>sql:" + sql);
        return jdbcTemplate.query(sql, rowMapper);
    }

    /**
     * 查询实体list
     * 返回  List<T>
     *
     * @param sql
     * @param args
     * @return
     */
    public List<T> list(String sql, Object[] args, Class c) throws Exception {
        List<CommonData> list = list(sql, args);
        Field[] fs = c.getDeclaredFields();
        List<T> result = new ArrayList<>();
        for (CommonData commonData : list) {
            Set<String> keys = commonData.keySet();
            T t = (T) c.newInstance();
            for (String key : keys) {
                String replace = key.replace("_", "").toUpperCase();
                for (Field field : fs) {
                    field.setAccessible(true);
                    String s = field.getName().toUpperCase();
                    if (replace.equals(s)) {
                        if (field.getType().getName().equals(String.class.getName())) {
                            field.set(t, commonData.getString(key));
                        } else if (field.getType().getName().equals(int.class.getName()) || field.getType().getName().equals(Integer.class.getName())) {
                            field.set(t, commonData.getInt(key));
                        } else if (field.getType().getName().equals(double.class.getName()) || field.getType().getName().equals(Double.class.getName())) {
                            field.set(t, commonData.getDouble(key));
                        } else if (field.getType().getName().equals(Date.class.getName())) {
                            field.set(t, commonData.getDate(key));
                        }

                    }
                }
            }
            result.add(t);
        }
        return result;
    }

    /**
     * 查询list
     * 返回  List<CommonData>
     *
     * @param sql
     * @param args
     * @return
     */
    public List<CommonData> list(String sql, Object[] args) {
        System.out.println(">>>>>>>>>>>>>sql:" + sql);
        System.out.println(">>>>>>>>>>>>>params:" + JSON.toJSONString(args));
        return jdbcTemplate.query(sql, rowMapper, args);
    }

    /**
     * 查询list
     * 返回  List<CommonData>
     *
     * @param sql
     * @param args
     * @return
     */
    public List<CommonData> list(String sql, List<Object> args) {
        System.out.println(">>>>>>>>>>>>>sql:" + sql);
        System.out.println(">>>>>>>>>>>>>params:" + JSON.toJSONString(args));
        return jdbcTemplate.query(sql, rowMapper, args.toArray());
    }

    /**
     * 更新
     *
     * @param sql
     * @param args
     * @return
     */
    public int update(String sql, List<Object> args) {
//        System.out.println(">>>>>>>>>>>>>sql:" + sql);
//        System.out.println(">>>>>>>>>>>>>params:" + args);
        int update = jdbcTemplate.update(sql, args.toArray());
        return update;
    }

    /**
     * 更新
     *
     * @param sql
     * @param args
     * @return
     */
    public int update(String sql, Object[] args) {
        System.out.println(">>>>>>>>>>>>>sql:" + sql);
        System.out.println(">>>>>>>>>>>>>params:" + args);
        int update = jdbcTemplate.update(sql, args);
        return update;
    }

    /**
     * 通用保存类
     *
     * @param objects
     * @param clazz
     */
    public void saveBatch(List<Object> objects, Class clazz) {
        if (objects.size() > 0) {
            String tableName = AnnotationReaderUtil.readTableNameAnnotation(clazz);
            StringBuilder sql = new StringBuilder("insert into ").append(tableName);
            sql.append(" (");
            StringBuilder valuesSql = new StringBuilder("values ");
            List<Object> values = new ArrayList<>();
            for (int j = 0; j < objects.size(); j++) {
                Object object = objects.get(j);
                MyEntity entity = AnnotationReaderUtil.getEntity(object, clazz);
                List<Object> fields = entity.getFields();
                values.addAll(entity.getValues());
                StringBuilder entitySql = new StringBuilder("(");
                for (int i = 0; i < fields.size(); i++) {
                    Object field = fields.get(i);
                    if (i < fields.size() - 1) {
                        if (j == 0) {
                            sql.append(field.toString()).append(",");
                        }
                        entitySql.append("?,");
                    } else {
                        if (j == 0) {
                            sql.append(field.toString()).append(")");
                        }
                        entitySql.append("?)");
                    }
                }
                valuesSql.append(entitySql).append(",");
            }
            sql.append(valuesSql);
            String sqlstr = sql.toString().substring(0, sql.length() - 1);
            //System.out.println(sql);
            update(sqlstr, values);
            values.clear();
            values = null;
            sql = null;
        }
    }


}

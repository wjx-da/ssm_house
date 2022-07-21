package com.wanjiaxin.util;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;


/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */

public class CommonData extends HashMap<String, Object> implements Serializable {

    private static final long serialVersionUID = 2804486092898525167L;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     *  通用对象 转换为实体
     * @return
     */
    public  <T extends AbstractEntity> T  convertToEntity(Class<T> classz){
        try {
            T enstance = classz.getDeclaredConstructor().newInstance();
            BeanUtils.populate(enstance , this);
            return enstance;
        } catch (Exception e){
            log.error("转换为实体时报错！", e);
        }
        return  null;
    };

    /**
     * 获取数据并转换为 LocalDate
     *
     * @param key
     * @return
     */
    public Date getDate(String key) {
        Object val = get(key);
        if (val == null) {
            return null;
        } else if (val instanceof Date) {
            return (Date) val;
        }
        return (Date) ConvertUtils.convert(val, Date.class);
    }


    /**
     *  获取数据并转换为 Stirng类型
     * @param key
     * @return
     */
    public String getString(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof String){
            return (String) val;
        }
        return ConvertUtils.convert(val);
    }

    /**
     *  获取数据并转换为 Integer
     * @param key
     * @return
     */
    public Integer getInt(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof Integer){
            return (Integer) val;
        }
        return (Integer) ConvertUtils.convert(val, Integer.class);
    }

    /**
     *  获取数据并转换为 Double
     * @param key
     * @return
     */
    public Double getDouble(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof Double){
            return (Double) val;
        }
        return (Double) ConvertUtils.convert(val, Double.class);
    }

    /**
     *  获取数据并转换为 Double
     * @param key
     * @return
     */
    public Boolean getBoolean(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof Boolean){
            return (Boolean) val;
        }
        return (Boolean) ConvertUtils.convert(val, Boolean.class);
    }

    /**
     *  获取数据并转换为 LocalDate
     * @param key
     * @return
     */
    public LocalDate getLocalDate(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof LocalDate){
            return (LocalDate) val;
        }
        return (LocalDate) ConvertUtils.convert(val, LocalDate.class);
    }

    /**
     *  获取数据并转换为 LocalDate
     * @param key
     * @return
     */
    public LocalDateTime getLocalDateTime(String key){
        Object val = get(key);
        if (val == null){
            return null;
        } else if (val instanceof LocalDateTime){
            return (LocalDateTime) val;
        }
        return (LocalDateTime) ConvertUtils.convert(val, LocalDateTime.class);
    }
}

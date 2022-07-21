package com.wanjiaxin.util;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */
@Slf4j
public class AnnotationReaderUtil {

    /**
     * 读取TableName注解
     *
     * @return
     */
    public static String readTableNameAnnotation(Class clazz) {
        TableName annotationField = (TableName) clazz.getAnnotation(TableName.class);
        if (annotationField != null) {
            return annotationField.value();
        }
        return "";
    }

    public static MyEntity getEntity(Object o, Class<?> c) {
        // 获取类中的所有定义字段
        Field[] fields = c.getDeclaredFields();
        String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        // 循环遍历字段，获取字段对应的属性值
        List<Object> fieldNames = new ArrayList<>();
        List<Object> values = new ArrayList<>();
        for (Field field : fields) {
            // 如果不为空，设置可见性，然后返回
            field.setAccessible(true);
            TableField tableField = field.getAnnotation(TableField.class);
            if (tableField == null || (tableField != null && tableField.exist())) {
                try {
                    if ("serialVersionUID".equals(field.getName())) {
                        continue;
                    }
                    Object value = field.get(o);
                    //if (!StringUtils.isEmpty(value)) {
                    String name = field.getName();
                    String[] split = name.split("");
                    String filed = "";
                    for (int i = 0; i < split.length; i++) {
                        if (upper.indexOf(split[i]) != -1) {
                            split[i] = "_" + split[i].toLowerCase();
                        }
                        filed += split[i];
                    }
                    fieldNames.add(filed);
                    values.add(value);
                    //}
                } catch (IllegalAccessException e) {
                    log.error("", e);
                }
            }
        }
        return new MyEntity(fieldNames, values);
    }
}


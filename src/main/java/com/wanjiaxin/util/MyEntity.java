package com.wanjiaxin.util;

import java.util.List;
import lombok.Data;
/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */
@Data
public class MyEntity {
    public MyEntity() {

    }

    public MyEntity(List<Object> fields, List<Object> values) {
        this.fields = fields;
        this.values = values;
    }

    private List<Object> fields;
    private List<Object> values;
}


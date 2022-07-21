package com.wanjiaxin.util;

import java.io.Serializable;

/**
 * @Description: $
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/7/21
 * springbootHouseRent
 * @Version 1.0
 */
public abstract class AbstractEntity implements Serializable {

    private static final long serialVersionUID = 2152251738146355893L;

    /**
     * 实体转换为map类型通用对象
     *
     * @return
     */
    public abstract CommonData convertToMap();


}

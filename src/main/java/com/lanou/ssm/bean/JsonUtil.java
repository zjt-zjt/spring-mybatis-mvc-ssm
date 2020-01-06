package com.lanou.ssm.bean;

import com.alibaba.fastjson.JSON;

public class JsonUtil {

    public static String toJsonString(Object obj) {
        return JSON.toJSONString(obj);
    }

}

package com.lanou.ssm.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseInfo {
    private Integer code;
    private String message;
    private Object data;

    public ResponseInfo() {
    }

    public ResponseInfo(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResponseInfo(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
}

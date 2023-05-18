package cn.tellsea.frame.common.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Tellsea
 * @date 2021/03/29
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class ResponseResult {

    private int code;

    private String msg;

    private int count;

    private Object data;

    public static ResponseResult success(String msg) {
        return new ResponseResult().setCode(200).setMsg(msg);
    }

    public static ResponseResult success(String msg, Object data) {
        return new ResponseResult().setCode(200).setMsg(msg).setData(data);
    }

    public static ResponseResult error(String msg) {
        return new ResponseResult().setCode(500).setMsg(msg);
    }

    public static ResponseResult error(String msg, Object data) {
        return new ResponseResult().setCode(500).setMsg(msg).setData(data);
    }

    public static ResponseResult table(int count, Object data) {
        return new ResponseResult().setCode(0).setMsg("查询成功").setCount(count).setData(data);
    }

    public static Map<String, Object> dTree(Object data) {
        Map<String, Object> code = new HashMap<>(16);
        code.put("code", 200);
        code.put("message", "查询成功");
        Map<String, Object> result = new HashMap<>(16);
        result.put("status", code);
        result.put("data", data);
        return result;
    }
}

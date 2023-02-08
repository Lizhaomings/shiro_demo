package com.demo.shiro_demo.common.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author Jerry
 * @Description 将string类型转换为data类型
 * @Create 26/12/2022 11:46 AM
 */
@Component
public class DateFormatConvert implements Converter<String, Date> {

    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public Date convert(String source) {
        if (source != null && !"".equals(source)) {
            try {
                Date date = sdf.parse(source);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}

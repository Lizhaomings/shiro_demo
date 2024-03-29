package cn.tellsea.frame.core.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 将string类型转换为date类型
 *
 * @author Tellsea
 * @date 2021/04/16
 */
@Component
public class DateFormatConvert implements Converter<String, Date> {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public Date convert(String source) {
        if (source != null && !"".equals(source)) {
            try {
                Date date = sdf.parse(source);
                return date;
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}

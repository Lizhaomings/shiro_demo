package cn.tellsea.frame.common.util;

import org.apache.commons.lang3.StringUtils;

/**
 * @author Tellsea
 * @date 2021/04/06
 */
public class StrawStringUtils {

    private static final int SIZE = 6;
    private static final String SYMBOL = "*";

    /**
     * 下划线转换为驼峰
     *
     * @param line             下划线字符串
     * @param firstIsUpperCase 首字母是否转换为大写
     * @return
     */
    public static String underline2Camel(String line, boolean... firstIsUpperCase) {
        String str = "";

        if (StringUtils.isBlank(line)) {
            return str;
        } else {
            StringBuilder sb = new StringBuilder();
            String[] strArr;
            // 不包含下划线，且第二个参数是空的
            if (!line.contains("_") && firstIsUpperCase.length == 0) {
                sb.append(line.substring(0, 1).toLowerCase()).append(line.substring(1));
                str = sb.toString();
            } else if (!line.contains("_") && firstIsUpperCase.length != 0) {
                if (!firstIsUpperCase[0]) {
                    sb.append(line.substring(0, 1).toLowerCase()).append(line.substring(1));
                    str = sb.toString();
                } else {
                    sb.append(line.substring(0, 1).toUpperCase()).append(line.substring(1));
                    str = sb.toString();
                }
            } else if (line.contains("_") && firstIsUpperCase.length == 0) {
                strArr = line.split("_");
                for (String s : strArr) {
                    sb.append(s.substring(0, 1).toUpperCase()).append(s.substring(1));
                }
                str = sb.toString();
                str = str.substring(0, 1).toLowerCase() + str.substring(1);
            } else if (line.contains("_") && firstIsUpperCase.length != 0) {
                strArr = line.split("_");
                for (String s : strArr) {
                    sb.append(s.substring(0, 1).toUpperCase()).append(s.substring(1));
                }
                if (!firstIsUpperCase[0]) {
                    str = sb.toString();
                    str = str.substring(0, 1).toLowerCase() + str.substring(1);
                } else {
                    str = sb.toString();
                }
            }
        }
        return str;
    }

    /**
     * 信息脱敏
     *
     * @param value
     * @return
     */
    public static String desensitization(String value) {
        if (null == value || "".equals(value)) {
            return value;
        }
        int len = value.length();
        int pamaone = len / 2;
        int pamatwo = pamaone - 1;
        int pamathree = len % 2;
        StringBuilder stringBuilder = new StringBuilder();
        if (len <= 2) {
            if (pamathree == 1) {
                return SYMBOL;
            }
            stringBuilder.append(SYMBOL);
            stringBuilder.append(value.charAt(len - 1));
        } else {
            if (pamatwo <= 0) {
                stringBuilder.append(value, 0, 1);
                stringBuilder.append(SYMBOL);
                stringBuilder.append(value, len - 1, len);

            } else if (pamatwo >= SIZE / 2 && SIZE + 1 != len) {
                int pamafive = (len - SIZE) / 2;
                stringBuilder.append(value, 0, pamafive);
                for (int i = 0; i < SIZE; i++) {
                    stringBuilder.append(SYMBOL);
                }
                if ((pamathree == 0 && SIZE / 2 == 0) || (pamathree != 0 && SIZE % 2 != 0)) {
                    stringBuilder.append(value, len - pamafive, len);
                } else {
                    stringBuilder.append(value, len - (pamafive + 1), len);
                }
            } else {
                int pamafour = len - 2;
                stringBuilder.append(value, 0, 1);
                for (int i = 0; i < pamafour; i++) {
                    stringBuilder.append(SYMBOL);
                }
                stringBuilder.append(value, len - 1, len);
            }
        }
        return stringBuilder.toString();
    }

    public static void main(String[] args) {
        System.out.println(desensitization("18386474459"));
    }
}

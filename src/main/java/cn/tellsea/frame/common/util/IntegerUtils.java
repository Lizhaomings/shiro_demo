package cn.tellsea.frame.common.util;

/**
 * Integer 类型工具类
 * 原符号       <       <=      >       >=      <>
 * 对应函数    lt()     le()    gt()    ge()    ne()
 *
 * @author Tellsea
 * @date 2021/04/12
 */
public class IntegerUtils {

    /**
     * 等于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean eq(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return val1.intValue() == val2.intValue();
        }
        return false;
    }

    /**
     * 大于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean gt(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return val1.intValue() > val2.intValue();
        }
        return false;
    }

    /**
     * 小于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean lt(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return val1.intValue() < val2.intValue();
        }
        return false;
    }

    /**
     * 大于等于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean ge(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return (val1.intValue() > val2.intValue()) || (val1.intValue() == val2.intValue());
        }
        return false;
    }

    /**
     * 小于等于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean le(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return (val1.intValue() < val2.intValue()) || (val1.intValue() == val2.intValue());
        }
        return false;
    }

    /**
     * 不等于
     *
     * @param val1
     * @param val2
     * @return
     */
    public static boolean ne(Integer val1, Integer val2) {
        if (val1 != null && val2 != null) {
            return val1.intValue() != val2.intValue();
        }
        return false;
    }
}

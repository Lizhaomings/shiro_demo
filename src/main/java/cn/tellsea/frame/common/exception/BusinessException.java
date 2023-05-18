package cn.tellsea.frame.common.exception;

/**
 * 业务通用自定义异常
 *
 * @author Tellsea
 * @date 2021/04/13
 */
public class BusinessException extends RuntimeException {

    public BusinessException(String message) {
        super(message);
    }
}

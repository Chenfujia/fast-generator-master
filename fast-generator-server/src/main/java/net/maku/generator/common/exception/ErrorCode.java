package net.maku.generator.common.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 错误编码
 *
 * @author 阿沐 babamu@126.com
*/
@Getter
@AllArgsConstructor
public enum ErrorCode {
    INTERNAL_SERVER_ERROR(500, "服务器异常，请稍后再试");

    private final int code;
    private final String msg;
}

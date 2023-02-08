package com.demo.shiro_demo.shiro.utils;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.CodecSupport;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.util.ByteSource;

import java.io.Serializable;
import java.util.Arrays;

/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 2:04 PM
 *
 * 为了解决redis序列化的问题，SimpleByteSource没有实现序列化接口
 * 在传入simpleAuthenticationInfo()的时候，缓存用户信息会出现序列化异常
 */
public class ShiroByteSource implements ByteSource, Serializable{

    private static final long serialVersionUID = -6814382603612799610L;
    private volatile byte[] bytes;
    private String cachedHex;
    private String cachedBase64;

    public ShiroByteSource() {
    }

    public ShiroByteSource(String string) {
        this.bytes = CodecSupport.toBytes(string);
    }

    public static ByteSource of(String string) {
        return new ShiroByteSource(string);
    }

    @Override
    public byte[] getBytes() {
        return new byte[0];
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    @Override
    public String toHex() {
        if (this.cachedHex == null) {
            this.cachedHex = Hex.encodeToString(getBytes());
        }
        return this.cachedHex;
    }

    @Override
    public String toBase64() {
        if (this.cachedBase64 == null){
            this.cachedBase64 = Base64.encodeToString(getBytes());
        }
        return this.cachedBase64;
    }

    @Override
    public boolean isEmpty() {
        return this.bytes == null || this.bytes.length == 0;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ByteSource) {
            ByteSource bs = (ByteSource) o;
            return Arrays.equals(getBytes(), bs.getBytes());
        }
        return false;
    }

    @Override
    public int hashCode() {
        if(this.bytes == null || this.bytes.length == 0) {
            return 0;
        }
        return Arrays.hashCode(this.bytes);
    }
}

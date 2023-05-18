package cn.tellsea.frame.common.util;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.hutool.core.date.DateUtil;
import lombok.extern.log4j.Log4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * 文件处理工具类
 *
 * @author Tellsea
 * @date 2021/04/07
 */
@Log4j
public class FileUtils {

    /**
     * 根路径
     */
    public static final String PROJECT_PATH = System.getProperty("user.dir");
    /**
     * 访问前缀
     */
    public static final String ACCESS_PREFIX = "/upload/";
    /**
     * 保存路径
     */
    public static final String UPLOAD_PATH = PROJECT_PATH + ACCESS_PREFIX;
    /**
     * 文件夹时间格式
     */
    public static final String DATE_FORMAT = "/yyyy-MM-dd/";

    /**
     * 文件上传
     *
     * @param file
     * @param folder
     * @return
     */
    public static String upload(MultipartFile file, String folder) {
        // 文件名
        String fileName = file.getOriginalFilename();
        // 后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        // 当前时间格式化
        String dateFormat = DateUtil.format(new Date(), DATE_FORMAT);
        // 上传后的路径
        String filePath = UPLOAD_PATH + folder + dateFormat;
        // 新文件名
        fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            String dbPath = ACCESS_PREFIX + folder + dateFormat + fileName;
            log.info("FileUtils 上传成功：" + dbPath);
            return dbPath;
        } catch (IOException e) {
            log.info("FileUtils 上传失败");
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 文件批量上传
     *
     * @param files
     * @param folder
     * @return
     */
    public static List<String> uploadBatch(MultipartFile[] files, String folder) {
        List<String> result = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            result.add(upload(files[i], folder));
        }
        return result;
    }

    /**
     * 下载文件
     *
     * @param fileName 文件名
     * @param filePath 文件路径
     * @param response
     */
    public static void download(String fileName, String filePath, HttpServletResponse response) throws FileNotFoundException {
        File file = new File(FileUtils.PROJECT_PATH + filePath);
        if (!file.exists()) {
            throw new FileNotFoundException("文件未找到");
        }
        response.reset();
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        response.setContentLength((int) file.length());
        try {
            fileName += filePath.substring(filePath.lastIndexOf("."));
            fileName = new String(fileName.getBytes("GBK"), StandardCharsets.ISO_8859_1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file))) {
            byte[] buff = new byte[1024];
            OutputStream os = response.getOutputStream();
            int i;
            while ((i = bis.read(buff)) != -1) {
                os.write(buff, 0, i);
                os.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 利用反射修改@Excel注解的savePath属性值
     *
     * @param fieldName 属性名
     * @param folder    文件夹名
     * @param pojoClass 类
     * @return
     */
    public static String resetExcelSavePath(String fieldName, String folder, Class<?> pojoClass) {
        try {
            Field field = pojoClass.getDeclaredField(fieldName);
            Excel excel = field.getAnnotation(Excel.class);
            InvocationHandler handler = Proxy.getInvocationHandler(excel);
            Field declaredField = handler.getClass().getDeclaredField("memberValues");
            declaredField.setAccessible(true);
            Map memberValues = (Map) declaredField.get(handler);
            String dateFormat = DateUtil.format(new Date(), FileUtils.DATE_FORMAT);
            String filePath = FileUtils.UPLOAD_PATH + folder + dateFormat;
            memberValues.put("savePath", filePath);
            return FileUtils.ACCESS_PREFIX + folder + dateFormat;
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}

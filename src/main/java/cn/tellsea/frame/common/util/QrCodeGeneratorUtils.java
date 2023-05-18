package cn.tellsea.frame.common.util;

import cn.hutool.core.date.DateUtil;
import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 生成二维码
 *
 * @author Tellsea
 * @date 2021/04/18
 */
public class QrCodeGeneratorUtils {

    /**
     * 文件上传的保存路径
     */
    public static String UPLOAD_PATH = System.getProperty("user.dir") + File.separator + "upload" + File.separator;

    public static String QRReader(File file) {
        try {
            MultiFormatReader formatReader = new MultiFormatReader();
            //读取指定的二维码文件
            BufferedImage bufferedImage = ImageIO.read(file);
            BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(bufferedImage)));
            //定义二维码参数
            Map hints = new HashMap<>();
            hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
            com.google.zxing.Result result = formatReader.decode(binaryBitmap, hints);
            //输出相关的二维码信息
            bufferedImage.flush();
            return result.getText();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 生成二维码，返回相对路径
     *
     * @param text
     * @return
     */
    public static String generateQRCodeImage(String text) {
        HashMap hashMap = new HashMap(16);
        // 设置二维码字符编码
        hashMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        // 设置二维码纠错等级
        hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
        // 设置二维码边距
        hashMap.put(EncodeHintType.MARGIN, 1);
        try {
            // 开始生成二维码
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, 300, 300, hashMap);

            String fileName = UUID.randomUUID() + ".png";
            String tempPath = "code" + File.separator + DateUtil.today() + File.separator;
            String targetPath = UPLOAD_PATH + tempPath;
            File fileDir = new File(targetPath);
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }

            // 导出到指定目录
            MatrixToImageWriter.writeToPath(bitMatrix, "png", new File(targetPath + fileName).toPath());

            return ("/upload/" + tempPath + fileName).replace("\\", "/");
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String text = "http://tellsea.4kb.cn/app/qrCode/scanCode/2";
        System.out.println(QrCodeGeneratorUtils.generateQRCodeImage(text));
    }
}

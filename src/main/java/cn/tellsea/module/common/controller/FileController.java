package cn.tellsea.module.common.controller;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.frame.common.util.FileUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.List;

/**
 * 文件上传下载
 *
 * @author Tellsea
 * @date 2021/04/07
 */
@Controller
@RequestMapping("/common/file")
public class FileController {

    @GetMapping("init")
    public String init() {
        return "common/file/file_init";
    }

    @ApiOperation("文件上传")
    @PostMapping("upload")
    @ResponseBody
    public ResponseResult upload(@RequestParam("file") MultipartFile file,
                                 @RequestParam(required = false, defaultValue = "default") String folder) {
        if (file.isEmpty()) {
            return ResponseResult.error("文件不能为空");
        }
        String filePath = FileUtils.upload(file, folder);
        return ResponseResult.success("上传成功", filePath);
    }

    @ApiOperation("文件批量上传")
    @PostMapping("uploadBatch")
    @ResponseBody
    public ResponseResult uploadBatch(@RequestParam("files") MultipartFile[] files,
                                      @RequestParam(required = false, defaultValue = "default") String folder) {
        if (files.length == 0) {
            return ResponseResult.error("文件不能为空");
        }
        List<String> filePathList = FileUtils.uploadBatch(files, folder);
        return ResponseResult.success("上传成功", filePathList);
    }

    @ApiOperation("文件下载")
    @GetMapping("download")
    @ResponseBody
    public void download(@RequestParam("fileName") String fileName, @RequestParam("filePath") String filePath,
                         HttpServletResponse response) throws FileNotFoundException {
        FileUtils.download(fileName, filePath, response);
    }
}

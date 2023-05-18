package cn.tellsea;

import cn.hutool.core.io.file.FileReader;

/**
 * @author Tellsea
 * @date 2021/03/29
 */
public class JavaTest {

    public static void main(String[] args) {
        /*Md5Hash md5Hash = new Md5Hash("123456", "VKqvum8YW0xNaTDFbrcijhTG6wUP5xAZ", 2);
        System.out.println(md5Hash);
        System.out.println(StringUtils.equals("a994fef0ddad5f9eed20804e7b18f559", md5Hash.toString()));*/
        FileReader fileReader = new FileReader("D:\\Workspace\\IDEAWorkspace\\Straw-Shiro\\README.md");
        String result = fileReader.readString();
        System.out.println(result);
    }
}

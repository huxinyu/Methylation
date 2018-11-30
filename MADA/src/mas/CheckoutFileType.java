package mas;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
/**
 * @Description: 处理上传附件,校验是否合法
 * 在服务器端判断文件类型的问题，故用获取文件头的方式，
 * 直接读取文件的前几个字节，来判断上传文件是否符合格式
 * @author: huangyawei
 * @Created 2013 2013-8-19下午18:58:15
 */
public class CheckoutFileType {
    //记录各个文件头信息及对应的文件类型
    public static Map<String, String> mFileTypes = new HashMap<String, String>();

    //所有合法的文件后缀
    public static String res_fileType=".csv.CSV.zip.ZIP";

    static {
        /**注意由于文本文档录入内容过多，则读取文件头时较为多变-START**/
        mFileTypes.put("0D0A0D0A", ".txt");//txt
        mFileTypes.put("0D0A2D2D", ".txt");//txt
        mFileTypes.put("0D0AB4B4", ".txt");//txt        
        mFileTypes.put("B4B4BDA8", ".txt");//文件头部为汉字
        mFileTypes.put("73646673", ".txt");//txt,文件头部为英文字母
        mFileTypes.put("32323232", ".txt");//txt,文件头部内容为数字
        mFileTypes.put("0D0A09B4", ".txt");//txt,文件头部内容为数字
        mFileTypes.put("3132330D", ".txt");//txt,文件头部内容为数字
    }


    public static String getFileType(InputStream  is) {
        byte[] b = new byte[4];
        if(is!=null){
            try {
                is.read(b, 0, b.length);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return mFileTypes.get(getFileHeader(b));
    }

    public static String getFileHeader(byte[] b) {
        String value = bytesToHexString(b);
        return value;
    }


    private static String bytesToHexString(byte[] src) {
        StringBuilder builder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        String hv;
        for (int i = 0; i < src.length; i++) {
            // 以十六进制（基数 16）无符号整数形式返回一个整数参数的字符串表示形式，并转换为大写
            hv = Integer.toHexString(src[i] & 0xFF).toUpperCase();
            if (hv.length() < 2) {
                builder.append(0);
            }
            builder.append(hv);
        }

        System.out.println("获取文件头信息:"+builder.toString());

        return builder.toString();
    }


    public static boolean getUpFilelegitimacyFlag(FileItem attachDoc){
        boolean upFlag=false;//为真表示符合上传条件，为假表标不符合
        if(attachDoc!=null){
            String attachName =attachDoc.getName();

            System.out.println("#######上传的文件:"+attachName);

            if(!"".equals(attachName)&&attachName!=null){

                /**返回在此字符串中最右边出现的指定子字符串的索引   **/
                String sname = attachName.substring(attachName.lastIndexOf("."));

                /**统一转换为小写**/
                sname=sname.toLowerCase();

                /**第一步：检查文件扩展名，是否符合要求范围**/
                if(res_fileType.indexOf(sname)!=-1){
                    upFlag=true;
                }

                /**
                 * 第二步：获取上传附件的文件头，判断属于哪种类型,并获取其扩展名          
                 * 直接读取文件的前几个字节，来判断上传文件是否符合格式
                 * 防止上传附件变更扩展名绕过校验
                 ***/
                if(upFlag){

                    byte[] b = new byte[4];



                    String req_fileType = null;
                    try {
                        req_fileType = getFileType(attachDoc.getInputStream());
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    System.out.println("///////用户上传的文件类型///////////"+req_fileType);
                    /**第三步：检查文件扩展名，是否符合要求范围**/
                    if(req_fileType!=null && !"".equals(req_fileType) && !"null".equals(req_fileType)){
                        /**第四步：校验上传的文件扩展名，是否在其规定范围内**/
                        if(res_fileType.indexOf(req_fileType)!=-1){
                            upFlag=true;
                        }else{
                            upFlag=false;
                        }
                    }else{
                        /**特殊情况校验,如果用户上传的扩展名为,文本文件,则允许上传-START**/
                        if(sname.indexOf(".txt")!=-1){
                            upFlag=true;
                        }else{
                            upFlag=false;
                        }
                        /**特殊情况校验,如果用户上传的扩展名为,文本文件,则允许上传-END**/
                    }
                }
            }
        }
        return upFlag;
    }

    /**
     * 主函数，测试用
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        //final String fileType = getFileType("D:/BICP-HUAWEI.mht");

        FileInputStream is = null;
        String value = null;

        String filePath = "D:/1.mhtml";
        try {
            is = new FileInputStream(filePath);
            byte[] b = new byte[4];
            is.read(b, 0, b.length);
            value = bytesToHexString(b);
        } catch (Exception e) {
        } finally {
            if (null != is) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
        }

        System.out.println(value);
    }
}
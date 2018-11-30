package mas;

import java.io.File;

import static org.apache.commons.io.FilenameUtils.getName;

/**
 * Created by Administrator on 2018/3/29.
 */
public class testSam {
    public static void main(String[] args) {
        String workflow_sample=null;

        File file = new File("C:\\Users\\Administrator\\Desktop\\huxy0105\\exe.zip");
        String workflow_sam1=file.getPath().substring(0,file.getPath().length()-4);
        String workflow_sam=file.getParent();
        System.out.println("workflow_sam1="+workflow_sam1);
        System.out.println("workflow_sam="+workflow_sam);
        File temp1 = new File(workflow_sam);
        if (temp1.isDirectory()) {
            File[] dirFile = temp1.listFiles();
            for (File f : dirFile) {
                if (f.getName().endsWith(".csv")) {
                    workflow_sample = f.getAbsolutePath();
                    System.out.println("workflow_sample="+workflow_sample);
                }else {
                    System.out.println("dhskjfhdskjfh");
                }
            }
        }
        //获取上传文件路径中的.csv文件
//        if (temp1.isDirectory()) {
//            File[] dirFile = temp1.listFiles();
//            for (File f : dirFile) {
//                if (f.isDirectory())
//                    getName(f.getAbsolutePath());
//                else {
//                    if (f.getName().endsWith(".csv")){
//                       String workflow_sample=f.getAbsolutePath();
//                        System.out.println("MHFJFGJGHJGH"+workflow_sample);
//                    }
//                }
//            }
//        }
    }
}

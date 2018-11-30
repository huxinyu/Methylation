package mas;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Administrator on 2016/12/6 0006.
 */
public class UploadUtil {
    public List<String>  upload(List<String> FileName,List<File> file) throws Exception{
        FileUtil fileUtil=new FileUtil();
        List<String> Upload_path=new LinkedList<String>();
          System.out.println("fsdfsdfsdf"+file.size());
        for(int i=0;i<file.size();i++) {
            System.out.println(file.size());
            System.out.println("###########################" + i + "#########################");
            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@" + FileName.get(i));
            String path = fileUtil.Upload_path() + "/" + FileName.get(i);
            OutputStream os = new FileOutputStream(new File(path));
            InputStream is = new FileInputStream(file.get(i));
            byte[] buf = new byte[1024];
            int length = 0;
//            String result;
//            while(result=is.readLine()!=null) {
            while (-1 != (length = is.read(buf))) {
                os.write(buf, 0, length);
                System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$" + path);

            }
            Upload_path.add(path);
            is.close();
            os.close();
            System.out.println("###########################");
        }
        System.out.println("######################end");
        return Upload_path;
    }

//    public boolean checkContext(InputStream is) throws Exception {
//        byte[] b = new byte[4];
//        is.read(b, 0, b.length);
//        CheckoutFileType checkoutFileType = new CheckoutFileType();
//        String context = checkoutFileType.getFileHeader(b);
//        if (context == "0D0A0D0A" || context == "0D0A2D2D" || context == "3132330D" || context == "73646673" || context == "32323232" || context == "0D0A09B4") {
//            return true;
//        }
//        else{
//            return false;
//        }
//    }
        public boolean checkType(String filename) throws Exception{
            String sname = filename.substring(filename.lastIndexOf("."));
            String res_fileType=".csv.CSV.zip.ZIP";
            if(res_fileType.indexOf(sname)!=-1){
               return true;
            }
            else {
                return false;
            }
        }

    public boolean Check(List<String> FileName,List<File> file) throws Exception{
        boolean flag=true;
        for(int i=0;i<file.size();i++) {
            InputStream is = new FileInputStream(file.get(i));
            if(checkType(FileName.get(i))){
              flag=true;
            }
            else{
                flag=false;
                break;
            }
        }

        if(flag){
            return true;
        }
        else{
            return false;
        }
    }

}

package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.imageio.stream.FileImageInputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.OutputStream;

/**
 * Created by USER on 2017/6/24.
 */
public class DownloadFile extends ActionSupport {

      private static final long serialVersionUID = 1L;


      private String contentType ;//文件的类型
      private long contentLength ;//流的长度
      private String contentDisposition ;// 用于指定文件名的内容配置头值
      private InputStream inputStream;//读取文件的输入流

      public static long getSerialVersionUID() {
          return serialVersionUID;
      }

      public String getContentType() {
          return contentType;
      }

      public void setContentType(String contentType) {
          this.contentType = contentType;
      }

      public long getContentLength() {
          return contentLength;
      }

      public void setContentLength(long contentLength) {
          this.contentLength = contentLength;
      }

      public String getContentDisposition() {
          return contentDisposition;
      }

      public void setContentDisposition(String contentDisposition) {
          this.contentDisposition = contentDisposition;
      }

      public InputStream getInputStream() {
          return inputStream;
      }

      public void setInputStream(InputStream inputStream) {
          this.inputStream = inputStream;
      }


      public String Download() throws IOException{
        //  HttpParameters parameters = ActionContext.getContext().getParameters();
        //  String fName1=parameters;

          HttpServletRequest req1 = ServletActionContext.getRequest();
          String fName1 = req1.getParameter("fileName");
  //        HttpServletResponse response=ServletActionContext.getResponse();
  //        response.setContentType("application/octet-stream");
  //        response.addHeader("Content-Disposition", "attachment; filename=" + fName1+"");


         // String [] fName = (String[]) map.get("fileName");
         // String fName1 = fName[0];
          String temp=fName1.substring(0,fName1.length()-7)+".zip";
          System.out.println("zhixingle temp");

          contentType = "application/octet-stream";                           //文件下载的类型
         contentDisposition = "attachment; filename = "+temp+"";
          System.out.println("zhixingle contentDisposition");
          // ServletContext servletContext = ServletActionContext.getServletContext();
          String fileName = "/home/bio/huxy/dataset/"+fName1;
          System.out.println("zhixingle "+fileName);
          inputStream = new FileInputStream(fileName);
          contentLength = inputStream.available();
          System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Downloads");
          return SUCCESS;
      }

  /*
    public String Download() throws IOException {

        HttpServletRequest req1 = ServletActionContext.getRequest();
        String fName1 = req1.getParameter("fileName");
        String filePath = "/home/bio/huxy/dataset/" + fName1;

        File file = new File(filePath);

            long fileLength = file.length();
            // 清空response
            response.reset();
            //octet-stream 自动匹配文件类型
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + fName1 + "\"");
        System.out.println("jfjfgjgjgjfName1="+fName1);

        response.setHeader("Content-Length", String.valueOf(fileLength));
            InputStream is = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            while (is.read(b) != -1) {
                os.write(b);
            }
            is.close();
            os.flush();
            os.close();

        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Downloads");
        return SUCCESS;
    }
    */

}

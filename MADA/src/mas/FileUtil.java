package mas;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.GZIPOutputStream;

import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarOutputStream;
/**
 * Created by Administrator on 2016/12/12 0012.
 */
public class FileUtil {
    private  int BUFFER = 1024*4;  //缓冲大小
    private  byte[] B_ARRAY = new byte[BUFFER];

    public  void  createDir(String destDirName) {
        File dir = new File(destDirName);
        if (dir.exists()) {
            System.out.println("create folder" + destDirName + "fail,folder has existed.");
        }
        if (!destDirName.endsWith(File.separator)) {
            destDirName = destDirName + File.separator;
        }
        //创建目录
        if (dir.mkdirs()) {
            System.out.println("create folder" + destDirName + "success！");
        } else {
            System.out.println("create folder" + destDirName + "fail！");
        }
    }
    public String  Result_path(){
        HttpServletRequest request= ServletActionContext.getRequest();
        Object obj = request.getSession().getAttribute("JobId");
        if(obj!=null) {
            String Result_path=GetProperty.getPropertyByName("Config", "Result_path")+"/"+obj.toString();
            createDir(Result_path);
            return Result_path;
        }
        else{
            return "No Result path!";
        }
    }
    public String Upload_path(){
        HttpServletRequest request= ServletActionContext.getRequest();
        Object obj = request.getSession().getAttribute("JobId");
        if(obj!=null) {
            String Upload_path=GetProperty.getPropertyByName("Config", "Upload_path")+"/"+obj.toString();
            createDir(Upload_path);
            return Upload_path;
        }
        else{
            return "No Upload path!";
        }
    }

    public String  adminCheck_path(){
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String time=format.format(date);
        String adminCheck_path=GetProperty.getPropertyByName("Config", "Result_path")+"/"+time+"_admin";
      //  createDir(adminCheck_path);
        return adminCheck_path;
    }

    public void  ZipMultiFile(String inputFileName, String targetFileName) {

        File inputFile = new File(inputFileName);
        String base = inputFileName
                .substring(inputFileName.lastIndexOf("/") + 1);
        TarOutputStream out = getTarOutputStream(targetFileName);
        tarPack(out, inputFile, base);
        try
        {
            if (null != out)
            {
                out.close();
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        compress(new File(targetFileName));
    }

    private void tarPack(TarOutputStream out, File inputFile, String base)
    {
        if (inputFile.isDirectory()) //打包文件夹
        {
            packFolder(out, inputFile, base);
        } else //打包文件
        {
            packFile(out, inputFile, base);
        }
    }

    /*
     * 方法功能：遍历文件夹下的内容，如果有子文件夹，就调用tarPack方法
     * 参数：out 打包后生成文件的流
     *       inputFile 要压缩的文件夹或文件
     *       base 打包文件中的路径
     */
    private void packFolder(TarOutputStream out, File inputFile, String base)
    {
        File[] fileList = inputFile.listFiles();
        try
        {
            //在打包文件中添加路径
            out.putNextEntry(new TarEntry(base + "/"));
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        base = base.length() == 0 ? "" : base + "/";
        for (File file : fileList)
        {
            tarPack(out, file, base + file.getName());
        }
    }

    /*
     * 方法功能：打包文件
     * 参数：out 压缩后生成文件的流
     *       inputFile 要压缩的文件夹或文件
     *       base 打包文件中的路径
     */
    private void packFile(TarOutputStream out, File inputFile, String base)
    {
        TarEntry tarEntry = new TarEntry(base);

        //设置打包文件的大小，如果不设置，打包有内容的文件时，会报错
        tarEntry.setSize(inputFile.length());
        try
        {
            out.putNextEntry(tarEntry);
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        FileInputStream in = null;
        try
        {
            in = new FileInputStream(inputFile);
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        int b = 0;

        try
        {
            while ((b = in.read(B_ARRAY, 0, BUFFER)) != -1)
            {
                out.write(B_ARRAY, 0, b);
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        } catch (NullPointerException e)
        {
            System.err.println("NullPointerException info ======= [FileInputStream is null]");
        } finally
        {
            try
            {
                if (null != in)
                {
                    in.close();
                }
                if (null != out)
                {
                    out.closeEntry();
                }
            } catch (IOException e)
            {

            }
        }
    }

    /*
     * 方法功能：把打包的tar文件压缩成gz格式
     * 参数：srcFile 要压缩的tar文件路径
     */
    private void compress(File srcFile)
    {
        File target = new File(srcFile.getAbsolutePath() + ".gz");
        FileInputStream in = null;
        GZIPOutputStream out = null;
        try
        {
            in = new FileInputStream(srcFile);
            out = new GZIPOutputStream(new FileOutputStream(target));
            int number = 0;
            while((number = in.read(B_ARRAY, 0, BUFFER)) != -1)
            {
                out.write(B_ARRAY, 0, number);
            }
        }catch(FileNotFoundException e)
        {
            e.printStackTrace();
        }catch(IOException e)
        {
            e.printStackTrace();
        }finally
        {
            try
            {
                if(in != null)
                {
                    in.close();
                }

                if(out != null)
                {
                    out.close();
                }
            }catch(IOException e)
            {
                e.printStackTrace();
            }
        }
    }

    /*
     * 方法功能：获得打包后文件的流
     * 参数：targetFileName 打包后文件的路径
     */
    private TarOutputStream getTarOutputStream(String targetFileName)
    {
        //如果打包文件没有.tar后缀名，就自动加上
        targetFileName = targetFileName.endsWith(".tar")?targetFileName:targetFileName+".tar";
        FileOutputStream fileOutputStream = null;
        try
        {
            fileOutputStream = new FileOutputStream(targetFileName);
        } catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
                fileOutputStream);
        TarOutputStream out = new TarOutputStream(bufferedOutputStream);

        //如果不加下面这段，当压缩包中的路径字节数超过100 byte时，就会报错
        out.setLongFileMode(TarOutputStream.LONGFILE_GNU);
        return out;
    }

}

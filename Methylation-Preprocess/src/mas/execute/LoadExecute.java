package mas.execute;

import mas.bean.LoadBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/11/30.
 */
public class LoadExecute {

    public void Load_execute(LoadBean loadBean) throws IOException{
        File temp=new File(loadBean.getDirectory());//获取文件路径
        if (!temp.exists()){temp.mkdirs(); }
        String fileName=temp.getName().substring(0, temp.getName().length())+".R";//定义文件名
        File file=new File(temp,fileName);//如果文件不存在，则新建文件；如果存在先删除再重建。
        if (!file.exists()){
            file.createNewFile();
        }
        else{
            file.delete();
            file.createNewFile();
        }
//        appendMethodB(temp+"/"+fileName,"ssh huxy@192.168.1.113 -tt\n");
//        appendMethodB(temp+"/"+fileName,"123456"+"\n");
//        appendMethodB(temp+"/"+fileName,"R"+"\n");
        appendMethodB(temp+"/"+fileName,"library(ChAMP)"+"\n");
        appendMethodB(temp+"/"+fileName,"myLoad=champ.load(directory=\""+loadBean.getDirectory()+"\",methValue=\""+loadBean.getMethValue()+"\","+loadBean.getOption()+")\n");
        appendMethodB(temp+"/"+fileName,"myNorm=champ.norm(resultsDir=\""+loadBean.getResultsDir()+"\",method=\"BMIQ\",plotBMIQ=TRUE)\n");
//        appendMethodB(temp+"\\"+fileName,"save.image(\"1.RData\")"+"\n");

//        String cmd1="\"F:\\Program Files\\R\\R-3.3.2\\bin\\R.exe\"  CMD BATCH --vanilla --slave"+" "+"\""+temp+"\\"+fileName+"\"";
        String cmd1="Rscript "+temp+"/"+fileName;
        System.out.println(cmd1);
        System.out.println("myLoad=champ.load(directory=\""+loadBean.getDirectory()+"\",methValue=\""+loadBean.getMethValue()+"\","+loadBean.getOption()+")");
        System.out.println("myNorm=champ.norm(resultsDir=\""+loadBean.getResultsDir()+"\",method=\"BMIQ\",plotBMIQ=TRUE)");
        BaseExecute util=new BaseExecute();
        util.executeCommand(cmd1);
        printList(util.getErroroutList());
    }
    public static void printList(List<String> list) {
        for (String string : list) {
            System.out.println(string);
        }
    }
    /*
    直接使用appendMethodB（）方法
     */
    public static void appendMethodB(String fileName, String content) {
        try {
            FileWriter writer = new FileWriter(fileName, true);
            writer.write(content);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

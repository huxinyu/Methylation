package mas.execute;

import mas.bean.SeqlmBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/22.
 */
public class SeqlmExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void seqlm_exe(SeqlmBean seqlmBean) throws IOException{
        //命令行执行文件.R
        String temp=seqlmBean.getInput_exprSetseq_file().substring(0,seqlmBean.getInput_exprSetseq_file().length()-4)+".R";
        /*
        //获得读取的csv文件的路径
        File file1 = new File(seqlmBean.getInput_sampleSheetseq_file());
        String sampleNamePath=file1.getParent();
        //获得读取的samplesheet.csv文件的文件名
        String sampleName=file1.getName();
        System.out.println(sampleNamePath);
        System.out.println(sampleName);
        */
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(seqlm)\n");
        appendMethodB(temp,"exprsetDir=\""+seqlmBean.getInput_exprSetseq_file()+"\""+"\n");
        appendMethodB(temp,"sampleDir=\""+seqlmBean.getInput_sampleSheetseq_file()+"\""+"\n");
        appendMethodB(temp,"value=read.csv(exprsetDir)\n");
        appendMethodB(temp,"rownames(value)= value [,1]\n");
        appendMethodB(temp,"value = value [,-1]\n");
        appendMethodB(temp,"value=as.matrix(value)\n");
        appendMethodB(temp,"value[sapply(value,is.infinite)]<-NA\n");
        appendMethodB(temp,"value=na.omit(value)\n");
        appendMethodB(temp,"targets=read.csv(file.path(sampleDir))\n");
        appendMethodB(temp,"ano=as.factor(targets$Sample_Group)"+"\n");
        appendMethodB(temp,"load(\"/home/bio/huxy/genome_information.RData\")"+"\n");
        appendMethodB(temp,"segments=seqlm(value,genome_information,ano,"+seqlmBean.getOption()+")\n");
        appendMethodB(temp,"seqlmreport(segments,value,genome_information,ano,dir=\""+seqlmBean.getPath()+"\","+seqlmBean.getOption1()+")\n");

        String cmd1="Rscript "+temp;
        System.out.println(cmd1);

        BaseExecute util1 = new BaseExecute();
        util1.executeCommand(cmd1);
        printList(util1.getStdoutList());
        StringBuffer sb=new StringBuffer();
        for(String item:util1.getErroroutList()){
            sb.append(item+"\n");
        }
        stdoutlist=stdoutlist+sb.toString();
        System.out.println("--------------------------");
        printList(util1.getErroroutList());
    }
    public static void printList(List<String> list) {
        for (String string : list) {
            System.out.println(string);
        }
    }
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

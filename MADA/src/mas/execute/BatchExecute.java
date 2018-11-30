package mas.execute;

import mas.bean.BatchBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public class BatchExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void batch_exe(BatchBean batchBean) throws IOException{
        //命令行执行文件.R
        String temp=batchBean.getInput_exprSetsva_file().substring(0,batchBean.getInput_exprSetsva_file().length()-4)+".R";
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(sva)"+"\n");
        appendMethodB(temp,"library(ChAMP)"+"\n");
        appendMethodB(temp,"exprsetDir=\""+batchBean.getInput_exprSetsva_file()+"\""+"\n");
        appendMethodB(temp,"sampleDir=\""+batchBean.getInput_sampleSheetsva_file()+"\""+"\n");
        appendMethodB(temp,"value=read.csv(exprsetDir)"+"\n");
        appendMethodB(temp,"rownames(value)=value[,1]"+"\n");
        appendMethodB(temp,"value=value[,-1]"+"\n");
        appendMethodB(temp,"value=as.matrix(value)\n");
        appendMethodB(temp,"targets=read.csv(file.path(sampleDir),stringsAsFactors = FALSE)\n");

        appendMethodB(temp,"batch=factor(targets$"+batchBean.getBatch()+")\n");
        appendMethodB(temp,"combat_bVals=value\n");
        appendMethodB(temp,"modcombat = model.matrix(~1+Sample_Group, data=targets)\n");
        appendMethodB(temp,"combat_bVals=ComBat(value,batch,modcombat)\n");
        appendMethodB(temp,"write.csv(combat_bVals,resultsDir=\"" + batchBean.getPath() + "\")\n");
        appendMethodB(temp,"champ.SVD(beta=value,pd=targets,resultsDir=\""+batchBean.getPath()+"/combat_Vals.csv\")\n");

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

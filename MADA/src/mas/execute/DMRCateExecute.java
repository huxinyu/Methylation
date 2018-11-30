package mas.execute;

import mas.bean.DMRCateBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public class DMRCateExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void DMRCate_exe(DMRCateBean dmrCateBean) throws IOException {
        //命令行执行文件.R
        String temp = dmrCateBean.getInput_exprSetdmr_file().substring(0, dmrCateBean.getInput_exprSetdmr_file().length() - 4) + ".R";
//        获得读取的samplesheet.csv文件的路径
//        File file1 = new File(dmrCateBean.getInput_exprSetdmr_file());
//        String sampleNamePath = file1.getParent();
//        String sampleName = file1.getName();
//        System.out.println(sampleNamePath);
//        System.out.println(sampleName);
        File temp1 = new File(temp);
        if (!temp1.exists()) {
            temp1.createNewFile();
        } else {
            temp1.delete();
            temp1.createNewFile();
        }
        appendMethodB(temp,"library(ChAMP)\n");
        appendMethodB(temp,"exprsetDir=\""+dmrCateBean.getInput_exprSetdmr_file()+"\""+"\n");
        appendMethodB(temp,"sampleDir=\""+dmrCateBean.getInput_sampleSheetdmr_file()+"\""+"\n");
        appendMethodB(temp,"value=read.csv(exprsetDir)\n");
        appendMethodB(temp,"rownames(value)= value [,1]\n");
        appendMethodB(temp,"value = value [,-1]\n");
        appendMethodB(temp,"value=as.matrix(value)\n");
        appendMethodB(temp,"targets=read.csv(file.path(sampleDir))\n");
        if (dmrCateBean.getMethValue().equals("getM")){
            appendMethodB(temp,"value=ilogit2(value)\n");
        }
        System.out.println("hdhfhfg");
        System.out.println(dmrCateBean.getMethValue());
        appendMethodB(temp,"myDMR=champ.DMR(value,pheno=targets$Sample_Group,method = \"DMRcate\",arraytype=\""+dmrCateBean.getArraytype()+"\","+dmrCateBean.getOption()+")\n");
        appendMethodB(temp,"write.table(myDMR, file = \""+dmrCateBean.getPath()+"/myDMR.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");


        String cmd1="Rscript "+temp;
        System.out.println(cmd1);
        System.out.println("myDMR=champ.DMR(value,pheno=targets$Sample_Group,method = \"DMRcate\",arraytype=\""+dmrCateBean.getArraytype()+"\","+dmrCateBean.getOption()+")\n");
        System.out.println("write.table(myDMR, file = \""+dmrCateBean.getPath()+"/myDMR.csv\", sep = \",\", col.names = NA,qmethod = \"double\")\n");

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

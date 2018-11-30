package mas.execute;

import mas.bean.SamrBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public class SamrExecute {
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void samr_exe(SamrBean samrBean) throws IOException{
        //命令行执行文件.R
        String temp=samrBean.getInput_exprSetsamr_file().substring(0,samrBean.getInput_exprSetsamr_file().length()-4)+".R";
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }

        appendMethodB(temp,"suppressPackageStartupMessages(library(samr))"+"\n");
        appendMethodB(temp,"exprsetDir=\""+samrBean.getInput_exprSetsamr_file()+"\""+"\n");
        appendMethodB(temp,"sampleDir=\""+samrBean.getInput_sampleSheetsamr_file()+"\""+"\n");
        appendMethodB(temp,"value=read.csv(exprsetDir)"+"\n");
        appendMethodB(temp,"rownames(value)=value[,1]"+"\n");
        appendMethodB(temp,"value=value[,-1]"+"\n");
        if (samrBean.getMethValue().equals("getM")){
            appendMethodB(temp,"value=ilogit2(value)\n");
        }
        appendMethodB(temp,"value=na.omit(value)\n");
        appendMethodB(temp,"exprSet=as.matrix(value)\n");
        appendMethodB(temp,"targets=read.csv(file.path(sampleDir),stringsAsFactors = FALSE)\n");
        appendMethodB(temp,"group_list=as.numeric(as.factor(targets$Sample_Group))\n");
        appendMethodB(temp,"data=list(x=exprSet,y=group_list,geneid=as.character(1:nrow(exprSet)),genenames=rownames(exprSet),logged2=TRUE)\n");
        appendMethodB(temp,"samr.obj<-samr(data, resp.type=\"Two class unpaired\", nperms=100)\n");
        appendMethodB(temp,"p=samr.pvalues.from.perms(samr.obj$tt,samr.obj$ttstar)\n");
        appendMethodB(temp,"p=as.data.frame(p)\n");
        appendMethodB(temp,"p$name=rownames(p)\n");
        appendMethodB(temp,"write.csv(p,file = \"" + samrBean.getPath() + "/samr_dmp.csv\")\n");
        appendMethodB(temp,"dmp1=p[p$p<0.05,]\n");

        if (samrBean.getArraytype().equals("450K")) {
            appendMethodB(temp, "library(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
            appendMethodB(temp, "ann = getAnnotation(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
            appendMethodB(temp, "annSub <- ann[match(rownames(dmp1),ann$Name),c(1:4,12:19,24:ncol(ann))]\n");
        }else {
            appendMethodB(temp,"library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
            appendMethodB(temp,"ann=getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
            appendMethodB(temp,"annSub <- ann[match(rownames(dmp2),ann$Name),c(1:4,12:19,22:ncol(ann))]\n");
        }
        appendMethodB(temp,"annSub=as.matrix(annSub)\n");
        appendMethodB(temp,"data=cbind(annSub,dmp1)\n");
        appendMethodB(temp,"write.csv(data,file = \""+samrBean.getPath()+"/samr_significant CpG sites_Annotation.csv\")\n");
        appendMethodB(temp,"body=data[grep(pattern=\"Body\",data[,15]),]\n" +
                "UTR5=data[grep(pattern=\"5'UTR\",data[,15]),]\n" +
                "TSS1500=data[grep(pattern=\"TSS1500\",data[,15]),]\n" +
                "TSS200=data[grep(pattern=\"TSS200\",data[,15]),]\n" +
                "stExon=data[grep(pattern=\"1stExon\",data[,15]),]\n" +
                "UTR3=data[grep(pattern=\"3'UTR\",data[,15]),]\n" +
                "x <-c(nrow(TSS1500),nrow(TSS200),nrow(UTR5),nrow(stExon),nrow(body),nrow(UTR3))\n" +
                "label <-c(\"TSS1500\", \"TSS200\",\"5'UTR\", \"1stExon\",\"Gene body\", \"3'UTR\")\n" +
                "df=cbind(label,x)\n" +
                "colnames(df)=c(\"Gene region feature category (UCSC)\",\"number\")\n" +
                "write.csv(df,file=\"" + samrBean.getPath() + "/Gene region feature category of significant CpG sites.csv\")\n");

            appendMethodB(temp,"piepercent<-round(100*x/sum(x), 1)\n" +
                    "piepercent <-paste(piepercent, \"%\", sep = \"\")\n" +
                    "pdf(\"" + samrBean.getPath() + "/pie plot.pdf\")\n" +
                    "pie(x,labels=piepercent, main=\"Gene region feature category of significant CpG sites\",col=terrain.colors (length(x)))\n" +
                    "legend(\"topright\",label, cex=0.8,fill=terrain.colors (length(x)))\n" +
                    "dev.off()\n");

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

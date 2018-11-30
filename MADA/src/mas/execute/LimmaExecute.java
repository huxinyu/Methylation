package mas.execute;

import mas.bean.LimmaBean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public class LimmaExecute{
    private String stdoutlist;
    public String getStdoutlist() {
        return stdoutlist;
    }
    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public void Limma_exe(LimmaBean limmaBean) throws IOException{
        //命令行执行文件.R
        String temp=limmaBean.getInput_exprSet_file().substring(0,limmaBean.getInput_exprSet_file().length()-4)+".R";
        File temp1=new File(temp);
        if(!temp1.exists()) {
            temp1.createNewFile();
        }
        else{
            temp1.delete();
            temp1.createNewFile();
        }

        appendMethodB(temp,"library(limma)"+"\n");
        appendMethodB(temp,"exprsetDir=\""+limmaBean.getInput_exprSet_file()+"\""+"\n");
        appendMethodB(temp,"sampleDir=\""+limmaBean.getInput_sampleSheet_file()+"\""+"\n");
        appendMethodB(temp,"value=read.csv(exprsetDir)"+"\n");
        appendMethodB(temp,"rownames(value)=value[,1]"+"\n");
        appendMethodB(temp,"value=value[,-1]"+"\n");
        appendMethodB(temp,"value=as.matrix(value)\n");
        appendMethodB(temp,"targets=read.csv(file.path(sampleDir))\n");

        if (limmaBean.getCor()==2&&!limmaBean.getCor1().equals("null")) {
            appendMethodB(temp, "ct=factor(targets$Sample_Group)\n");
            System.out.print(limmaBean.getCor1()+limmaBean.getCor());
            if (limmaBean.getCor1_type().equals("continuous")) {
                System.out.print("continuous"+limmaBean.getCor1_type());
                appendMethodB(temp,"cor1=as.numeric(targets$" + limmaBean.getCor1() + ")\n");
                appendMethodB(temp,"design=model.matrix(~0+ct+cor1)\n");
                appendMethodB(temp,"colnames(design)=c(levels(ct),\""+limmaBean.getCor1()+"\")\n");
            }else{
                System.out.print("other"+limmaBean.getCor1_type());
                appendMethodB(temp,"cor1=factor(targets$" + limmaBean.getCor1() + ")\n");
                appendMethodB(temp,"design=model.matrix(~0+ct+cor1)\n");
                appendMethodB(temp,"colnames(design)=c(levels(ct),levels(cor1)[-1])\n");
            }
            appendMethodB(temp,"contrast.matrix<-makeContrasts(paste0(unique(targets$Sample_Group),collapse = \"-\"),levels = design)\n");
        } else {
            System.out.print("wu xie bian lian ");
            appendMethodB(temp,"design=model.matrix(~0+factor(targets$Sample_Group))\n");
            appendMethodB(temp,"rownames(design)=colnames(value)\n");
            appendMethodB(temp,"colnames(design)=levels(factor(targets$Sample_Group))\n");
            appendMethodB(temp,"contrast.matrix<-makeContrasts(paste0(unique(targets$Sample_Group),collapse = \"-\"),levels = design)\n");
        }

        appendMethodB(temp,"fit <- lmFit(value,design)\n");
        appendMethodB(temp,"fit2 <- contrasts.fit(fit, contrast.matrix)\n");
        appendMethodB(temp,"fit2 <- eBayes(fit2)\n");
        if (limmaBean.getArraytype().equals("450K")) {
            appendMethodB(temp, "library(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
            appendMethodB(temp, "ann = getAnnotation(IlluminaHumanMethylation450kanno.ilmn12.hg19)\n");
            appendMethodB(temp, "annSub <- ann[match(rownames(value),ann$Name),c(1:4,12:19,24:ncol(ann))]\n");
        }else {
            appendMethodB(temp,"library(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
            appendMethodB(temp,"ann=getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b2.hg19)\n");
            appendMethodB(temp,"annSub <- ann[match(rownames(value),ann$Name),c(1:4,12:19,22:ncol(ann))]\n");
        }
        appendMethodB(temp,"DMPs <- topTable(fit2,  num=Inf, coef=1, genelist=annSub)\n");
        appendMethodB(temp,"write.csv(DMPs, file = \""+limmaBean.getPath()+"/DMP.csv\")\n");
        appendMethodB(temp,"tempOutput = topTable(fit2, coef=1, n=Inf)\n");
        appendMethodB(temp,"nrDEG = na.omit(tempOutput)\n");
        appendMethodB(temp,"testP=DMPs[DMPs$adj.P.Val<"+limmaBean.getAdjPval()+",]\n");
        appendMethodB(temp,"write.csv(testP,file = \"" + limmaBean.getPath() + "/significant CpG sites.csv\")\n");
        appendMethodB(temp,"body=testP[grep(pattern=\"Body\",testP[,15]),]\n" +
                "UTR5=testP[grep(pattern=\"5'UTR\",testP[,15]),]\n" +
                "TSS1500=testP[grep(pattern=\"TSS1500\",testP[,15]),]\n" +
                "TSS200=testP[grep(pattern=\"TSS200\",testP[,15]),]\n" +
                "stExon=testP[grep(pattern=\"1stExon\",testP[,15]),]\n" +
                "UTR3=testP[grep(pattern=\"3'UTR\",testP[,15]),]\n" +
                "x <-c(nrow(TSS1500),nrow(TSS200),nrow(UTR5),nrow(stExon),nrow(body),nrow(UTR3))\n" +
                "label <-c(\"TSS1500\", \"TSS200\",\"5'UTR\", \"1stExon\",\"Gene body\", \"3'UTR\")\n" +
                "df=cbind(label,x)\n" +
                "colnames(df)=c(\"Gene region feature category (UCSC)\",\"number\")\n" +
                "write.csv(df,file=\"" + limmaBean.getPath() + "/Gene region feature category of significant CpG sites.csv\")\n");
        if(limmaBean.getPlot()==1){
            appendMethodB(temp,"library(ggplot2)\n");
            appendMethodB(temp,"library(ggthemes)\n");
            appendMethodB(temp,"library(Cairo)\n");
            appendMethodB(temp,"nrDEG$threshold <- as.factor(ifelse(nrDEG$P.Value < "+limmaBean.getP_Value()+" & abs(nrDEG$logFC) >="+limmaBean.getLogFC()+",ifelse(nrDEG$logFC > "+limmaBean.getLogFC()+" ,'Up','Down'),'Not'))\n");
            appendMethodB(temp,"Cairo(file=\"volcan_PNG_DMP.png\",type=\"png\",units=\"in\",bg=\"white\",width=5.5,height=5,pointsize=12,dpi=300)\n");
            appendMethodB(temp,"ggplot(data=nrDEG, aes(x=logFC, y =-log10(P.Value),color =threshold)) +geom_point() +scale_color_manual(values =c('blue',\"black\",\"red\"))+geom_hline(yintercept = -log10("+limmaBean.getP_Value()+"),lty=4,lwd=0.6,alpha=0.8)+geom_vline(xintercept = c("+limmaBean.getLogFC()+",-"+limmaBean.getLogFC()+"),lty=4,lwd=0.6,alpha=0.8)+theme_bw()+theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.line = element_line(colour = \"black\")) +labs( x=\"logFC\",y=\"-log10 (P.Value)\",title=\"Volcano picture of DMP\")+theme(plot.title = element_text(hjust = 0.5))\n");
            appendMethodB(temp,"ggsave(\"" + limmaBean.getPath() + "/volcano plot.pdf\")\n");
        }else if (limmaBean.getPlot()==2){
            appendMethodB(temp,"library(qqman)\n");
            if (limmaBean.getArraytype().equals("450K")){
            appendMethodB(temp,"dmp<-DMPs[,c(1,2,4,23,26,27)]\n");
            }else
            {
                appendMethodB(temp,"dmp<-DMPs[,c(1,2,4,38,41)]\n");
            }
            appendMethodB(temp,"dmp<-dmp[abs(dmp$logFC)>"+limmaBean.getLogFC1()+",]\n");
            appendMethodB(temp,"dmp$chr<-gsub(\"[^0-9]\",\"\",dmp$chr)\n");
            appendMethodB(temp,"dmp$chr<-as.numeric(dmp$chr)\n");
            appendMethodB(temp,"dmp=na.omit(dmp)\n");
            appendMethodB(temp,"manhattan(dmp,ylim = c(0, 10), cex = 0.7,suggestiveline = -log10(0.05),genomewideline = -log10(0.01),chr = \"chr\",bp = \"pos\",p = \"P.Value\",snp = \"Name\",col = c(\"#57b3fc\", \"#192a3a\"))\n");
            appendMethodB(temp,"pdf( \"" + limmaBean.getPath() + "/scatter plot.pdf\")\n");
            appendMethodB(temp,"dev.off()\n");
        }else if (limmaBean.getPlot()==4){
            appendMethodB(temp,"piepercent<-round(100*x/sum(x), 1)\n" +
                    "piepercent <-paste(piepercent, \"%\", sep = \"\")\n" +
                    "pdf(\"" + limmaBean.getPath() + "/pie plot.pdf\")\n" +
                    "pie(x,labels=piepercent, main=\"Gene region feature category of significant CpG sites\",col=terrain.colors (length(x)))\n" +
                    "legend(\"topright\",label, cex=0.8,fill=terrain.colors (length(x)))\n" +
                    "dev.off()\n");
        }else {
            appendMethodB(temp,"");

        }

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

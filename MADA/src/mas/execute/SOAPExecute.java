package mas.execute;

import mas.GetProperty;
import mas.bean.SOAPBean;

import java.io.File;
import java.util.List;

/**
 * Created by lily on 7/21/16.
 */
public class SOAPExecute {
    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    private String stdoutlist;

    public void SOAP_build(SOAPBean soapBean){
        String cmd1;
        String commandline;
        commandline = GetProperty.getPropertyByName("Config", "soap_build");
        cmd1 = commandline+"  " +soapBean.getReference();
        System.out.println(cmd1);
        BaseExecute util = new BaseExecute();
        util.executeCommand(cmd1);
        printList(util.getStdoutList());
        StringBuffer sb=new StringBuffer();
        for(String item:util.getErroroutList()){
            sb.append(item+"\n");
        }
        stdoutlist=stdoutlist+sb.toString();
        System.out.println("--------------------");
        printList(util.getErroroutList());
    }
    public void SOAP_align(SOAPBean soapBean){
        String cmd1;

        if(soapBean.getType()==1){
            File temp=new File(soapBean.getReads_single());
            String out = temp.getName().substring(0, temp.getName().length()- 5);
            String commandline;
            commandline = GetProperty.getPropertyByName("Config", "soap");
            cmd1 = commandline+"  -a " +soapBean.getReads_single()+" -D "+soapBean.getReference()+".index"+" -o "+soapBean.getPath()+"/"+out+"sam "+soapBean.getOption();
        }
        else{
            File temp1=new File(soapBean.getReads_pair1());
            String out1 = temp1.getName().substring(0, temp1.getName().length()- 5);
            File temp2=new File(soapBean.getReads_pair1());
            String out2= temp2.getName().substring(0, temp2.getName().length()- 5);
            String commandline;
            commandline = GetProperty.getPropertyByName("Config", "soap");
            cmd1 = commandline+"  -a " +soapBean.getReads_pair1()+" -b "+soapBean.getReads_pair2()+" -D "+soapBean.getReference()+".index -o "+soapBean.getPath()+"/"+out1+"sam "+" -2 "+soapBean.getPath()+"/"+out2+" "+soapBean.getOption();
        }
        System.out.println(cmd1);
        BaseExecute util = new BaseExecute();
        util.executeCommand(cmd1);
        printList(util.getStdoutList());
        StringBuffer sb=new StringBuffer();
        for(String item:util.getErroroutList()){
            sb.append(item+"\n");
        }
        stdoutlist=stdoutlist+sb.toString();
        System.out.println("--------------------");
        printList(util.getErroroutList());
    }
    public static void printList(List<String> list) {
        for (String string : list) {
            System.out.println(string);
        }
    }
}

package mas.service;

import mas.bean.SOAPBean;
import mas.execute.SOAPExecute;

/**
 * Created by lily on 7/21/16.
 */
public class SOAPService {
    private SOAPBean soapBean;
    private SOAPExecute soapExecute;

    public SOAPBean getSoapBean() {
        return soapBean;
    }

    public void setSoapBean(SOAPBean soapBean) {
        this.soapBean = soapBean;
    }

    public SOAPExecute getSoapExecute() {
        return soapExecute;
    }

    public void setSoapExecute(SOAPExecute soapExecute) {
        this.soapExecute = soapExecute;
    }
    public String SOAP(){
        soapExecute.SOAP_build(soapBean);
        soapExecute.SOAP_align(soapBean);
        return soapExecute.getStdoutlist();
    }
    public String SOAP_unBuild(){
        soapExecute.SOAP_align(soapBean);
        return soapExecute.getStdoutlist();
    }
}

package mas.service;

import mas.bean.KEGGBean;
import mas.execute.KEGGExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/4/2.
 */
public class KEGGService {
    private KEGGExecute keggExecute;
    private KEGGBean keggBean;

    public KEGGExecute getKeggExecute() {
        return keggExecute;
    }

    public void setKeggExecute(KEGGExecute keggExecute) {
        this.keggExecute = keggExecute;
    }

    public KEGGBean getKeggBean() {
        return keggBean;
    }

    public void setKeggBean(KEGGBean keggBean) {
        this.keggBean = keggBean;
    }

    public String KEGG() throws IOException {
        keggExecute.KEGG_exe(keggBean);
        return keggExecute.getStdoutlist();

    }

}

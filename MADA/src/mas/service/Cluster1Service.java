package mas.service;

import mas.bean.Cluster1Bean;
import mas.execute.Cluster1Execute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/7/9.
 */
public class Cluster1Service {
    private Cluster1Bean cluster1Bean;
    private Cluster1Execute cluster1Execute ;

    public Cluster1Bean getCluster1Bean() {
        return cluster1Bean;
    }

    public void setCluster1Bean(Cluster1Bean cluster1Bean) {
        this.cluster1Bean = cluster1Bean;
    }

    public Cluster1Execute getCluster1Execute() {
        return cluster1Execute;
    }

    public void setCluster1Execute(Cluster1Execute cluster1Execute) {
        this.cluster1Execute = cluster1Execute;
    }
    public String Cluster1() throws IOException {
        cluster1Execute.Cluster1_exe(cluster1Bean);
        return cluster1Execute.getStdoutlist();

    }
}

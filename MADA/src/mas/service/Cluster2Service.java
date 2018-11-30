package mas.service;

import mas.bean.Cluster2Bean;
import mas.execute.Cluster2Execute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/7/9.
 */
public class Cluster2Service {
    private Cluster2Bean cluster2Bean;
    private Cluster2Execute cluster2Execute ;

    public Cluster2Bean getCluster2Bean() {
        return cluster2Bean;
    }

    public void setCluster2Bean(Cluster2Bean cluster2Bean) {
        this.cluster2Bean = cluster2Bean;
    }

    public Cluster2Execute getCluster2Execute() {
        return cluster2Execute;
    }

    public void setCluster2Execute(Cluster2Execute cluster2Execute) {
        this.cluster2Execute = cluster2Execute;
    }
    public String Cluster2() throws IOException {
        cluster2Execute.Cluster2_exe(cluster2Bean);
        return cluster2Execute.getStdoutlist();
    }
}

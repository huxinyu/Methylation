package mas.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import java.util.Map;

/**
 * Created by Administrator on 2017/3/15 0015.
 */
public class Exit extends ActionSupport {

    public String Exit() throws Exception{
        ActionContext ac=ActionContext.getContext();
        Map session=ac.getSession();
        session.remove("account");
        session.remove("password");
        session.remove("login");
        return  SUCCESS;
    }
}

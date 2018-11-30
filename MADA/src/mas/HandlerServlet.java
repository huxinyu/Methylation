package mas;

/**
 * Created by USER on 2017/12/15.
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HandlerServlet extends HttpServlet {
    int count=0;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException,IOException
    {
        resp.setContentType("text/html;charset=GBK");
        PrintWriter out=resp.getWriter();

        TokenProcessor processor=TokenProcessor.getInstance();
        if(processor.isTokenValid(req))
        {
            try
            {
                Thread.sleep(5000);
            }
            catch(InterruptedException e)
            {
                System.out.println(e);
            }

            System.out.println("submit : "+count);
            if(count%2==1)
                count=0;
            else
                count++;
            out.println("success");
        }
        else
        {
            processor.saveToken(req);
            out.println("你已经提交了表单，同一表单不能提交两次。");
        }
        out.close();
    }
}

package mas;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class MultiFilter implements Filter {

    private String[] characterParams = null;
    private boolean OK=true;

    public void destroy() {
        // TODO Auto-generated method stub

    }
    /**
     * 此程序块主要用来解决参数带非法字符等过滤功能
     */
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain arg2) throws IOException, ServletException {

        HttpServletRequest servletrequest = (HttpServletRequest) request;
        HttpServletResponse servletresponse = (HttpServletResponse) response;
          CommonsMultipartResolver commonsMultipartResolver=new CommonsMultipartResolver(servletrequest.getSession().getServletContext());
          MultipartHttpServletRequest multipartRequest=commonsMultipartResolver.resolveMultipart(servletrequest);

        boolean status1=false;

        Map multipart = multipartRequest.getParameterMap();
        Iterator entries = multipart.entrySet().iterator();
        Map.Entry entry;
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            Object valueObj = entry.getValue();
            if(null == valueObj){
                value = ""+value;
            }else if(valueObj instanceof String[]){
                String[] values = (String[])valueObj;
                for(int i=0;i<values.length;i++){
                    value = values[i] +value;
                }
            }else{
                value = valueObj.toString()+value;
            }
            System.out.println("%%%%%%%%%%%%%%%%%%%%%"+value+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        }
        for (int i = 0; i < characterParams.length; i++) {
            if (value.indexOf(characterParams[i]) >= 0) {
                status1 = true;
                break;
            }
        }


        if (status1) {
            PrintWriter out = response.getWriter();
            out
                    .print("<script language='javascript'>alert(\"page error!\");"
                            // + servletrequest.getRequestURL()
                            + "window.history.go(-1);</script>");

        }else
            request=multipartRequest;
            arg2.doFilter(request, response);

    }

    public void init(FilterConfig config) throws ServletException {
        if(config.getInitParameter("characterParams").length()<1)
            OK=false;
        else
            this.characterParams = config.getInitParameter("characterParams").split(",");
    }



}
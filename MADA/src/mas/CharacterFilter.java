package mas;

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
public class CharacterFilter implements Filter {

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
     //   CommonsMultipartResolver commonsMultipartResolver=new CommonsMultipartResolver(servletrequest.getSession().getServletContext());
      //  MultipartHttpServletRequest multipartRequest=commonsMultipartResolver.resolveMultipart(servletrequest);

        boolean status = false;
        boolean status1=false;
        java.util.Enumeration params = request.getParameterNames();
        String param="";
        String paramValue = "";
        servletresponse.setContentType("text/html; charset=UTF-8" );
        while (params.hasMoreElements()) {
            param = (String) params.nextElement();
            String[] values = request.getParameterValues(param);
            paramValue = "";
            if(OK){//过滤字符串为0个时 不对字符过滤
                for (int i = 0; i < values.length; i++)
                    paramValue=paramValue+values[i];
                for(int i=0;i<characterParams.length;i++)
                    if (paramValue.indexOf(characterParams[i]) >= 0) {
                        status = true;
                        break;
                    }
                if(status)break;
            }
        }

      /*  Map<String, String> returnMap=getParameterMap(servletrequest);
        Set<String> set = returnMap.keySet();


        for(String s:set)
        {
            String value = returnMap.get(s);
            for (int i = 0; i < characterParams.length; i++) {
                if (value.indexOf(characterParams[i]) >= 0) {
                    status1 = true;
                    break;
                }
            }
        }*/
        Map multipart = servletrequest.getParameterMap();
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
        }
            for (int i = 0; i < characterParams.length; i++) {
                if (value.indexOf(characterParams[i]) >= 0) {
                    status1 = true;
                    break;
                }
            }


        if (status||status1) {
            PrintWriter out = servletresponse.getWriter();
            out
                    .print("<script language='javascript'>alert(\"page error!\");"
                            // + servletrequest.getRequestURL()
                            + "window.history.go(-1);</script>");

        }else
            arg2.doFilter(request, response);

    }

    public void init(FilterConfig config) throws ServletException {
        if(config.getInitParameter("characterParams").length()<1)
            OK=false;
        else
            this.characterParams = config.getInitParameter("characterParams").split(",");
    }



}
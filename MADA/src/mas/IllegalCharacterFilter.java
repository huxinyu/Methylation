package mas;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class IllegalCharacterFilter implements Filter {

    private String[] words;
    private String encoding;
    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        encoding = fConfig.getInitParameter("encoding");
        words = new String[]{"~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")",";","\"", "'", "\\", "<", ">", "?", "/", "<<", ">>","+"};
    }
    /**
     * 具体过滤方法，并将非法字符替换成“***”
     */
    public String filter(String param){
        if(words!=null&&words.length>0){
            for(int i=0;i<words.length;i++){
                if(param.indexOf(words[i])!= -1){
                    param = param.replaceAll(words[i], "***");
                }
            }
        }
        return param;

    }

    /**
     * 一般使用ServletRequest对象获取表单提交的数据，
     * （主要通过 getParameter() 和 getParameterValues()
     * 方法获取），再此创建内部类Request,重写getParameter()
     * 和 getParameterValues()，并在重写的两个方法中实现过滤
     */

    class Request extends HttpServletRequestWrapper{//HttpServletRequest                                                                      //Wrapper是servletRequest的实现类

        public Request(HttpServletRequest request) {
            super(request);
        }

        @Override
        public String getParameter(String name) {
            // 返回过滤后的参数值
            return filter(super.getRequest().getParameter(name));
        }

        @Override
        public String[] getParameterValues(String name) {
            // 获取所有参数值
            String[] values = super.getRequest().getParameterValues(name);
            //通过循环对所有参数进行进行过滤
            for(int i=0;i<values.length;i++){
                values[i] = filter(values[i]);
            }
            return values;
        }

    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if(encoding != null){
            request.setCharacterEncoding(encoding);
            //将request替换为重写后的request
            request = new Request((HttpServletRequest) request);
            response.setContentType("text/html; charset = "+encoding);

        }
        chain.doFilter(request, response);
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        this.words = null;
        this.encoding = null;
    }
}
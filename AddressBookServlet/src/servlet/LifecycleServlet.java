package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifecycleServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		System.out.println("Lifecycle: init()");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Lifecycle: service()");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Lifecycle: doGet()");

		ServletContext context = getServletContext();
		String dburl = context.getInitParameter("dburl");
		String dbuser = context.getInitParameter("dbuser");
		String dbpass = context.getInitParameter("dbpass");
		
		ServletConfig config = getServletConfig();
		String servletName = config.getInitParameter("servlet-name");
			
		PrintWriter out = resp.getWriter();
		out.println("<h1>doGet call</h1>");
		out.println("<h3>Context Init Params</h3>");
		out.println("<ul>");
		out.println("<li>dburl:" + dburl + "</li>");
		out.println("<li>dbuser:" + dbuser + "</li>");
		out.println("<li>dbpass:" + dbpass + "</li>");
		out.println("<ul>");
		
		out.println("<h3>Servlet Init Params</h3>");
		out.println("<p>servlet-name:" + servletName + "</p>");
	}
	
	@Override
	public void destroy() {
		System.out.println("Lifcycle: destroy()");
	}	
}

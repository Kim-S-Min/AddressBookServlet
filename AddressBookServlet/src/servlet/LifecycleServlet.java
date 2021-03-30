package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//	서블릿의 생명 주기 확인
public class LifecycleServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// 첫 호출시 init메서드가 수행: 서블릿 초기화를 담당한다
//		super.init();
		System.out.println("Lifecycle: init()");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청이 들어올때 호출된다, 요청방식에 따라 doGet or doPost가 호출된다
		// 요청 메서드 방식에 관계 없이 호출된다
//		super.service(req, resp);
		System.out.println("Lifecycle: service()");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청이 GET메서드일 때 호출된다
//		super.doGet(req, resp);
		System.out.println("Lifecycle: doGet()");
		//	컨텍스트 파라미터 불러오기
		//	1. 웹 앱의 컨텍스트 확보
		ServletContext context = getServletContext();
		String dburl = context.getInitParameter("dburl");
		String dbuser = context.getInitParameter("dbuser");
		String dbpass = context.getInitParameter("dbpass");
		
		//	서블릿 초기화 파라미터
		//	먼저 서블릿 설정 받아오기
		ServletConfig config = getServletConfig();
		String servletName = config.getInitParameter("servlet-name");
		
		//	응답 인코딩 설정	-> 필터에서 처리
//		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("text/html;charset=UTF-8");
		
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
		// 서버가 중단되거나 오랜시간동안 서블릿 요청이 없을 때 -> 서블릿의 자원 정리
		System.out.println("Lifcycle: destroy()");
	}	
}

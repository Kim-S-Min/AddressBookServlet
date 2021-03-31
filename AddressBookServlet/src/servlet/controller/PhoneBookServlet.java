package servlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.dao.PhoneBookDAO;
import servlet.dao.PhoneBookDAOImpl;
import servlet.dao.PhoneBookVo;

@WebServlet(name="PhoneBook", urlPatterns="/el")
public class PhoneBookServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PhoneBookDAO dao = new PhoneBookDAOImpl();
		String action = req.getParameter("a");	
		
		if("search".equals(action)) {
			String keyword = req.getParameter("keyword");
			List<PhoneBookVo> list = dao.search(keyword);
			req.setAttribute("list", list);
			req.setAttribute("keyword", keyword);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/emaillist/index.jsp");
			rd.forward(req, resp);	
			
		} else if ("form".equals(action)) {
				RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/emaillist/form.jsp");
				rd.forward(req, resp);
			
		} else  if ("delete".equals(action)) {
			Long no = Long.valueOf(req.getParameter("no"));
			dao.delete(no);
			resp.sendRedirect(req.getContextPath() + "/el");
			
		} else {
			List<PhoneBookVo> list = dao.getList();
			req.setAttribute("list", list);	
			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/emaillist/index.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if("insert".equals(action)) {
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String tel = req.getParameter("tel");
			
			PhoneBookVo vo = new PhoneBookVo();
			vo.setName(name);
			vo.setHp(hp);
			vo.setTel(tel);
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			dao.insert(vo);
			resp.sendRedirect(req.getContextPath() + "/el");
		} else {
			doGet(req, resp);
		}
	}	
}
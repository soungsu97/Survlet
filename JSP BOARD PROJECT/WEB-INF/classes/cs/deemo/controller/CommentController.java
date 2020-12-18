package cs.deemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.deemo.command.CInsertCommand;
import cs.deemo.command.CListCommand;
import cs.deemo.command.MCommand;

@WebServlet("*.rp")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		MCommand command = null;
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf(".rp"));
		
		int cboard = Integer.parseInt(request.getParameter("cboard"));
		String ccontent = request.getParameter("ccontent");
		
		if(com != null && com.trim().equals("replyLoad")) {
			command = new CListCommand();
			command.execute(request, response);
			viewPage = "comment.jsp";
			System.out.println("controller부분list");
		}
		if(com != null && com.trim().equals("replyInsert")) {
			command = new CInsertCommand();
			command.execute(request, response);
			viewPage = "comment.jsp";	
			System.out.println("controller부분insert");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

}

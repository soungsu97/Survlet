package cs.deemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.deemo.command.BDeleteCommand;
import cs.deemo.command.BInsertCommand;
import cs.deemo.command.BUpdateCommand;
import cs.deemo.command.BViewCommand;
import cs.deemo.command.BPagingCommand;
import cs.deemo.command.BSearchCommand;
import cs.deemo.command.MCommand;
import cs.deemo.command.MInsertCommand;
import cs.deemo.command.MLoginCommand;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage =null;
		MCommand command = null;
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/list.do
		String com= uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".do"));
		
		
		if(com !=null && com.trim().equals("insert")) {
			command = new MInsertCommand();
			command.execute(request, response);
			viewPage ="index.jsp";
		}
		else if(com !=null && com.trim().equals("login")) {
			command = new MLoginCommand();
			command.execute(request, response);
			viewPage ="index.jsp";
		}

		if(com !=null && com.trim().equals("boardlist")) {
			command = new BPagingCommand();
			command.execute(request, response);
			viewPage = "board.jsp";
		}
		else if(com !=null && com.trim().equals("binsert")) {
			command = new BInsertCommand();
			command.execute(request, response);
			viewPage ="boardlist.do";
		}
		else if(com !=null && com.trim().equals("bview")) {
			command = new BViewCommand();
			command.execute(request, response);
			viewPage ="boardContext.jsp";
		}
		else if (com != null && com.trim().equals("bupdate")) {
			command = new BUpdateCommand();
			command.execute(request, response);
		      viewPage = "bview.do";
	    } else if (com != null && com.trim().equals("bdelete")) {
	    	command = new BDeleteCommand();
			command.execute(request, response);
		      viewPage = "boardlist.do";
	    }
	    else if (com != null && com.trim().equals("bupdate2")) {
	    	command = new BViewCommand();
			command.execute(request, response);
			viewPage ="boardUpdate.jsp";
	    }
	    else if (com != null && com.trim().equals("search")) {
	    	command = new BSearchCommand();
			command.execute(request, response);
			viewPage ="board.jsp";
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

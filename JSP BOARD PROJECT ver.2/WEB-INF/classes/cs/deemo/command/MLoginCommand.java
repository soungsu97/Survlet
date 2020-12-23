package cs.deemo.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.deemo.dao.MemberDAO;

public class MLoginCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");		

		MemberDAO dao = new MemberDAO();
		int check = dao.loginCheck(id, pwd);
		System.out.println(check);
			switch(check){
			case 1:
				session.setAttribute("id",id);
				break;
			case 0:
				break;
			default:
				break;
			}
		}
	}



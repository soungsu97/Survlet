package cs.deemo.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import cs.deemo.dao.CommentDAO;

public class CListCommand implements MCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cboard = request.getParameter("cboard");
		
		CommentDAO dao = new CommentDAO();
				
		JSONArray dtos = dao.rlist(cboard);
		
		request.setAttribute("dtos", dtos);
	}

}

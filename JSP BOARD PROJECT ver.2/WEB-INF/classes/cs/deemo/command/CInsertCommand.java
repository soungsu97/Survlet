package cs.deemo.command;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.deemo.dao.CommentDAO;
import cs.deemo.dto.CommentDTO;

public class CInsertCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();


		String cboard = request.getParameter("cboard");
		String cid = (String)session.getAttribute("id");
		String ccontent = URLDecoder.decode(request.getParameter("ccontent"), "utf-8");
		
		CommentDAO dao = new CommentDAO();
		
		dao.register(cboard, ccontent, cid );
	}	
}

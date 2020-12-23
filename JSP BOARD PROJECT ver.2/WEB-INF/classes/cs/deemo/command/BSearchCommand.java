package cs.deemo.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.deemo.dao.BoardDAO;
import cs.deemo.dto.BoardDTO;

public class BSearchCommand implements MCommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	BoardDAO dao = new BoardDAO();
	
	String kwd = request.getParameter("kwd");
	
	ArrayList<BoardDTO> dtos = dao.selectSearchBoard(kwd);

	request.setAttribute("dtos", dtos);
	}
}

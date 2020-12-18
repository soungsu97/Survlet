package cs.deemo.command;

import cs.deemo.dao.BoardDAO;
import cs.deemo.dto.BoardDTO;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateCommand implements MCommand {
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    BoardDTO dto = new BoardDTO();
    BoardDAO dao = new BoardDAO();
    
    dto.setNo(request.getParameter("no"));
    dto.setTitle(request.getParameter("title"));
    dto.setContext(request.getParameter("context"));
    dao.update(dto);
    
  }
}
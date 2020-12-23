package cs.deemo.command;

import cs.deemo.dao.BoardDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BDeleteCommand implements MCommand {
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    String no = request.getParameter("no");
    BoardDAO dao = new BoardDAO();
    dao.delete(no);
  }
}
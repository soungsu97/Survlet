package cs.deemo.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import cs.deemo.dao.BoardDAO;
import cs.deemo.dto.BoardDTO;
import oracle.jdbc.proxy.annotation.GetDelegate;

public class BInsertCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		BoardDTO dto = new BoardDTO();	//DB에 데이터를 저장하기 위해 DTO 객체 생성
		
		dto.setTitle(request.getParameter("title"));
		dto.setWriter((String)session.getAttribute("id"));
		dto.setContext(request.getParameter("context"));
		
		BoardDAO dao = new BoardDAO();	
		dao.insert(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
	}
}

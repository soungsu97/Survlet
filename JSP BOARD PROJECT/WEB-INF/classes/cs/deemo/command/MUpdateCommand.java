package cs.deemo.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.deemo.dao.MemberDAO;
import cs.deemo.dto.MemberDTO;

public class MUpdateCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  //한글 처리
		
		MemberDTO dto = new MemberDTO();
		
		dto.setPwd(request.getParameter("pwd"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setMobile(request.getParameter("mobile"));
		
		MemberDAO dao = new MemberDAO();

		dao.update(dto);//DB에 변경된 데이터 업데이트
	}
}

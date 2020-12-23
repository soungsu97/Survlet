package cs.deemo.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.deemo.dao.BoardDAO;
import cs.deemo.dto.BoardDTO;
import cs.deemo.dto.Paging;

public class BPagingCommand implements MCommand{
	@Override
	  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	     
	    BoardDAO dao = new BoardDAO();
		
	    int start = 0;
	    int end = 0;
	    int totalCount = dao.getCount();
	    int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	    Paging paging = new Paging();
	    paging.setPageNo(page); //get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
	    paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
	    paging.setTotalCount(totalCount);
	     
	    start = (page - 1) * 5 + 1;	     //select해오는 기준을 구한다.
	    end = page*5;
	    
	    ArrayList<BoardDTO> list = dao.list(start, end);
	    	    
	    request.setAttribute("dtos", list);
	    request.setAttribute("paging", paging);
	  }
}

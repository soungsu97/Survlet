package cs.dit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/calc")
public class Calcu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	public void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
			
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int num1, num2, result;
		String sym;
		
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		sym = request.getParameter("sym");
		
		result = calc(num1, num2, sym);
		
		out.println("<html>");
		out.println("<head><title>계산 결과</title></head>");
		out.println("<body>");
		out.println("<h2>계산결과 : " + result + "</h2>");
		out.println("</body></html>");
	}
	
	public int calc(int num1, int num2, String sym) {
		int result = 0;
		switch (sym) {
		case "+":
			result = num1 + num2;
			break;
		case "-":
			result = num1 - num2;
			break;
		case "*":
			result = num1 * num2;
			break;
		case "/":
			result = num1 / num2;
			break;
		}
		
		return result;
		
	}
	
}

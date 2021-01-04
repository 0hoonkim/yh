package ch15;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCntServlet
 */

public class UpdateCntServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		int num = Integer.parseInt(request.getParameter("num"));
		bMgr.upCount2(num);
		response.sendRedirect("thema_sub.jsp?snum=");
		
	}
}

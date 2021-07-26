package tt;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.boardDAO;
/**
 * Servlet implementation class mytripSend
 */
@WebServlet("/mytripsend.jsp")
public class myTripSend extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }
   
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   

	req.setCharacterEncoding("utf-8"); //받아올 데이터의 인코딩

	


	boardDAO mt = new boardDAO();

    String id = req.getParameter("id");
	String myTripTitle = req.getParameter("myTripTitle"); 
	String[] index = req.getParameterValues("myTripIndex");
	String[] name = req.getParameterValues("myTripName");
	String[] time = req.getParameterValues("myTripTime");
	String[] distance = req.getParameterValues("myTripDistance");
	String TotalDistance = req.getParameter("TotalDistance");
	String TotalTime = req.getParameter("TotalTime");
	String[] x = req.getParameterValues("myTripx");
	String[] y = req.getParameterValues("myTripy");
	String []viaTime = req.getParameterValues("myTripViatime");
	int available = 0;

	

	




	for(int i=0;i<index.length;i++){
		System.out.println("page number21231233 : " + index[i]);
		
		int vtime = Integer.parseInt(viaTime[i]);
		mt.set_mytrip(id, myTripTitle, index[i], name[i], time[i], distance[i], TotalDistance, TotalTime,x[i],y[i],vtime,available);

	}
	resp.sendRedirect("login.jsp");

}
}
package User;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/EnteringServlet"})
public class EnteringServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  public EnteringServlet() {
    super();
  }
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    
    String idRollNo = request.getParameter("idRollNo");
    String password = request.getParameter("password");
    
    HttpSession session=request.getSession();
    session.setAttribute("idRollNo",idRollNo);
   
    User user1=new Login(idRollNo, password);
    String result=user1.admin(idRollNo, password);
    if(result.equals("User is registered")){
              RequestDispatcher dispatcher = request.getRequestDispatcher("adminAdmission.jsp");
              dispatcher.include(request, response);
    }else{
    result= user1.login(idRollNo, password);
    if(result.equals("User is registered")){
              RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
              dispatcher.include(request, response);
    }else{
      RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
      dispatcher.include(request, response);
    }
  }
 }
}
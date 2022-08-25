package RequestServlet;
import User.Loan;
import User.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/LoanRequest"})
public class LoanRequest extends HttpServlet {
  private static final long serialVersionUID = 1L;
  public LoanRequest() {
    super();
  }
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    String idRollNo = request.getParameter("idRollNo");
    String fullname=request.getParameter("fullname");
    String course=request.getParameter("course");
    
    
   User user= new Loan(idRollNo, fullname, course);
   String result= user.add(idRollNo, fullname, course);
    if (result.equals("User is registered")){
      RequestDispatcher dispatcher = request.getRequestDispatcher("loan.jsp");
      dispatcher.include(request, response);
    } else {
      RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
      dispatcher.include(request, response);
    }
  }
}

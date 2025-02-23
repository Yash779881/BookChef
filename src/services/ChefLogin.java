package services;
import java.sql.*;
import database.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChefLogin
 */
public class ChefLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChefLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try
		{
			String cemail = request.getParameter("cemail");
			String cpass = request.getParameter("cpass");
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from chef_db where cemail=? and cpass=?");
			ps.setString(1,cemail);
			ps.setString(2,cpass);
			ResultSet rs =ps.executeQuery();
			if(rs.next()){
				GettersSetters.setGetCid(rs.getInt(1));
				response.sendRedirect("chefhome.html");
			}else{
				response.sendRedirect("error.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

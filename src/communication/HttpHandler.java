package communication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.Context;

/**
 * Servlet implementation class HttpHandler
 */
@WebServlet("/HttpHandler")
public class HttpHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HttpHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx;
		try {
			ctx = new Context(request, response);
		} catch (Exception e) {
			System.out.println("Fatal error: the server is not functioning yet.");
			e.printStackTrace();
			return;
		}
		
		String command = request.getParameter("cmd");
		
		if (command == null)
			response.getWriter().print("<p style='font-size: 24px'>I don't understand you!!!</p>");
		
		else {
			switch(command) {
			case "register":
				ctx.handleRegistration();
				break;
			case "login":
				ctx.handleLogin();
				break;
			case "logout":
				ctx.handleLogout();
				break;
			case "other":
				response.getWriter().print("<p style='font-size: 24px'>not supported yet!!!</p>");
				break;
			case "acceptPost":
				ctx.handleAcceptPost();
				break;
			case "removePost":
				ctx.handleRemovePost();
				break;
			case "uploadFile":
				/* String filename1= uploadTheFile(request, "file1", UPLOAD_FOLDER);*/
				/*String other = request.getParameter("other");*/
				/*here you can call ctx.something(filename1,other)*/
				break;
			default:
				ctx.handleUnknownRequest();
			}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;


import model.MySQLDB;
import model.Post;
import model.User;

//This class is a middle layer class between the "communication" layers 
//and the back-end/model/db layers. it provides mainly business logic to
//your web site.
//it has two constructors, one usually used from servlets/listeners modules 
//and the other used from jsp pages
public class Context {
	HttpServletRequest request;
	HttpServletResponse  response;
	HttpSession session;
	ServletContext application;
	PrintWriter out;

	static MySQLDB dbc= new MySQLDB();
	
	
	private final String SESSION_KEY_USER = "currentUser";
	private final String SESSION_KEY_MANAGER = "isManager";

//used mainly from JSP	
	public Context(PageContext pContext) throws Exception {
		this((HttpServletRequest)pContext.getRequest(), 
				(HttpServletResponse)pContext.getResponse());
	}
	
//used mainly from servlets...
	public Context(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		
		this.response = response;
		this.session = request.getSession();
		this.application = this.session.getServletContext();
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			this.out = response.getWriter();
			
			if (dbc.IsDbConnected() == false) {
				throw(new Exception("no db connection"));
			}
		} catch (IOException e) {};
				
	}
	
	public void insertAlertDlg(String msg, String forwardToPage){
		out.write("<script charset=\"UTF-8\">");
		out.write("alert('" + msg + "');");
		//out.write("setTimeout(function(){window.location.href='secondpage.jsp'},1000);");
		if (forwardToPage!= null)
			out.write("window.location.href='"+ forwardToPage + "';");
		out.write("</script>");
	}
	
	
	public void handleLogout(){
		this.session.removeAttribute(SESSION_KEY_USER);
		try {
			response.sendRedirect("home.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean isLoggedIn(){
		return (this.session.getAttribute(SESSION_KEY_USER)!= null);
	}
	
	public boolean isManager(){
		User u = (User) this.session.getAttribute(SESSION_KEY_USER);
		return (u!= null) &&  u.getRole().equals(User.MGR_ROLE);
	}
	
	public String getCurrentUserName() {
		User u = (User) this.session.getAttribute(SESSION_KEY_USER);
		return (u==null)?"אורח": u.getNickName();
	}
	
	public void handleLogin() {
		
		String nickname= request.getParameter("nickname");
		String password= request.getParameter("password");
		try {
			User u = dbc.UserAuthenticate(nickname, password);
			if(u!=null) {
				this.session.setAttribute(SESSION_KEY_USER, u);
				String url = "home.jsp?name=" + URLEncoder.encode(nickname, "UTF-8");
				response.sendRedirect(url);
				//you might need to encode the url in some unresolved cases where sessionID needs to be enforced
				//response.sendRedirect(response.encodeRedirectURL(url));
			}
			else {
				 request.setAttribute("error",  "שם המשתמש או הסיסמא אינם נכונים, אנא נסה שוב");
				 request.getRequestDispatcher("tofes.jsp").forward(request, response);
		
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		} 
	}
	
	public void handleRegistration() {
		String nickname= request.getParameter("nickname");
		if(!getFieldFromRequest("password").equals(getFieldFromRequest("password2"))){
			request.setAttribute("error", "לא ניתן ליצור משתמש זה, הסיסמאות אינן זהות.");
			try {
				request.getRequestDispatcher("tofes.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (userCanBeRegistered(nickname)){
			dbc.AddNewUser(userFromRequest());
			handleLogin();
		} else {
			request.setAttribute("error", "שם משתמש זה כבר בשימוש, אנא הזן שם אחר");
			try {
				request.getRequestDispatcher("tofes.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void handleAcceptPost() {
		int pid = Integer.parseInt(request.getParameter("pid"));
		dbc.acceptPost(pid);
		try {
			response.sendRedirect("verifyPosts.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void handleRemovePost() {
		int pid = Integer.parseInt(request.getParameter("pid"));
		dbc.removePost(pid);
		try {
			response.sendRedirect("verifyPosts.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public String getFieldFromRequest(String key){
		return (request.getParameter(key) != null? request.getParameter(key): "");
	}
	
	private User userFromRequest() {
		User u = new User();
		u.setEmail(getFieldFromRequest("email"));
		u.setNickName(getFieldFromRequest("nickname"));
		u.setPassword(getFieldFromRequest("password"));
		u.setRole(getFieldFromRequest("role"));
		//update this method to reflect your user object
		return u;
	}
	
	private boolean userCanBeRegistered(String nickname){
		return !dbc.UserExists(nickname);
	}
	
	public void handleUnknownRequest() {
		try {
			response.sendRedirect("home.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getPostHTML(Date date, String name, String email, String content){
        return "<div style=\"height: 100px; width: 80%; background-color: yellowgreen;\">\n"
        +"<p style=\"float: right;\" id=\"date\"></p>" + date + "</p>\n"
        +"<p style=\"float: left;\" id=\"email\"></p>" + email+ "</p>\n"
        +"<hr>\n"
        +"<p style=\"float: right;\" id=\"name\">" + name + "</p> <p style=\"float: right; white-space: pre;\">  : </p>\n"
        +"<p style=\"float: right;\" id=\"comment_content\">" + content + "</p>\n"
        +"</div>";
    }
	
	public String getAwaitingPostsAsHTML(){
		List<Post> awaitingPosts = dbc.getWaitingPosts();
		String html = "";
		for (Post post : awaitingPosts) {
			html += getPostHTML(post.getDate(), post.getUname(), post.getUemail(), post.getText()) +
				 "	<form method=\"post\">  " + 
				 "	<input formaction=\"HttpHandler?cmd=acceptPost&pid=" + post.getId() + "\" type=\"submit\" name=\"btAccept\" value=\"אשר\" />  " + 
				 "	<input formaction=\"HttpHandler?cmd=removePost&pid=" + post.getId() + "\" type=\"submit\" name=\"btDelete\" value=\"מחק\" />  " + 
				 "	</form>	"
				 +  "<br>	";
		}
		return html;
	}
	
}

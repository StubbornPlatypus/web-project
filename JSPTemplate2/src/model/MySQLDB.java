package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public class MySQLDB {
	Connection con;
	
	public MySQLDB(){
		String connectionURL = "jdbc:mysql://localhost:3306/mysqldb?serverTimezone=Asia/Jerusalem";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection(connectionURL, "root", "SQLBlaBlaBla1");
        } catch (Exception e) {
			System.out.println("error in connecting to the DB");
			con = (Connection)null;	
        }
	}
	
	public boolean IsDbConnected()
	{
		return con != null;
	}
	
	public boolean UserExists(String nickname){
		
		try{
		    Statement statement = con.createStatement();
            String queryString = "SELECT * FROM users WHERE nickname='" + nickname + "'";
            ResultSet rs = statement.executeQuery(queryString);
            return((rs != null) && (rs.next()));
		} catch (Exception e) {
								System.out.println("error in querying the DB");
								return true;			
				   			  }
	}
	
	

	
	public void AddNewUser(User user){
       String sqlString = "INSERT INTO  users" + " (nickname, password, role)" 
							+ "VALUES ('"
							+ user.getNickName() + "', '" 
        					+ user.getPassword()  + "', '" 
							+ user.getRole() + "')";
        try {
        		Statement statement = con.createStatement();
	            statement.executeUpdate(sqlString);
	            
	            statement.close();
            } catch(SQLException ex) {
            	System.out.println("SQLException: " + ex.getMessage());
            	}			
	}

	public boolean ModifyUser(User user){
	    try {
		        String updString = "UPDATE users SET password =?, role = ?"
		        		+ "   WHERE nickname='" + user.getNickName() + "'" ;
				PreparedStatement statement = con.prepareStatement(updString);
				statement.setString(3, user.getPassword());
				statement.setString(4, user.getRole());
	            statement.executeUpdate();
			    statement.close();
			    return true;
	    	} catch(SQLException ex) {System.out.println("SQLException: " + ex.getMessage());
	    								return false;
	    								}			
	}
	
	
	public User UserAuthenticate(String name, String pass){
		try{
		    Statement statement = con.createStatement();
            String queryString = "SELECT * FROM users WHERE nickname='" + name + "' and password='" + pass + "'" ;
            ResultSet rs = statement.executeQuery(queryString);
            if (rs.next()==true) {
            	User u = new User();
            	u.setId(rs.getInt("id"));
            	u.setNickName(rs.getString("nickname"));
            	u.setRole(rs.getString("role"));
            	return u;
            }
            else return null;
 		} catch (Exception e) {
								System.out.println("error in querying the DB");
								return null;			
				   			  }
	}
	
	

	public List<User> getAllUsers()
	{
	    Statement statement;
        ResultSet rs;
		try {
				statement = con.createStatement();
		        String queryString;
		        queryString = "SELECT * FROM users";
		        
				rs = statement.executeQuery(queryString);
				List<User> result = new ArrayList<User>();
				while(rs.next()) {
					User u = new User();
					u.setNickName(rs.getString(rs.findColumn("nickname")));
					u.setPassword(rs.getString(rs.findColumn("password")));
					u.setRole(rs.getString(rs.findColumn("role")));
					u.setId(rs.getInt(rs.findColumn("id")));
					result.add(u);
				}
				return result;
			} catch (SQLException e) 
			{
				System.out.println("error in querying the DB");
				e.printStackTrace();
				return null;
			}
	}
	
	public List<String> getAllUsersNickNames()
	{
	    Statement statement;
        ResultSet rs;
		try {
				statement = con.createStatement();
		        String queryString;
		        queryString = "SELECT nickname FROM users";
		        queryString += " order by nickname DESC";
				rs = statement.executeQuery(queryString);
				List<String> users = new ArrayList<String>();
				while (rs.next())
					users.add(rs.getString(rs.findColumn("nickname")));
				return users;
			} catch (SQLException e) 
			{
				System.out.println("error in querying the DB");
				e.printStackTrace();
				return null;
			}
	}
	
	
	public boolean DeleteUser(String nickName)
	{
		try{
	        String delString = "DELETE FROM users  WHERE nickname=?";
			PreparedStatement statement = con.prepareStatement(delString);
			statement.setString(1, nickName);
            statement.executeUpdate();
            return true;
		} catch (Exception e) {
				System.out.println("error deleting the user");	
				return false;
			  }
	}

	
	public void Close() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			con = null;
		}
	}

}

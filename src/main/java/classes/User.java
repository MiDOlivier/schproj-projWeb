package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;
import mail.SendMail;

public class User {
	private int userid = 0;
	private String usernickname = "";
	private String usermail = "";
	private String userpasswd = "";
	private String userpicture = "";
	
	private String tableName	= "ccrc_db.user"; 
	private String fieldsName	= "userid, usernickname, usermail, userpasswd, userpicture";  
	private String fieldKey		= "userid";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	public User (int userid, String usernickname, String usermail, String userpasswd, String userpicture) {
		this.setUserid(userid);
		this.setUsernickname(usernickname);
		this.setUsermail(usermail);
		this.setUserpasswd(userpasswd);
		this.setUserpicture(userpicture);
	}
	
	public User (String usernickname, String usermail, String userpasswd) {
		this.setUserid(0);
		this.setUsernickname(usernickname);
		this.setUsermail(usermail);
		this.setUserpasswd(userpasswd);
	}
	
	public User (String usermail, String userpasswd) {
		this.setUserid(0);
		this.setUsernickname("");
		this.setUsermail(usermail);
		this.setUserpasswd(userpasswd);
	}
	
	public User () {
		this.setUserid(0);
	}
	
	public User (int userid) {
		this.setUserid(userid);
	}
	
	public void save() {
		if( this.getUserid() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getUserid() > 0 ) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public void fillfromEmailAndPass() throws NumberFormatException, SQLException {
		this.setUserid(this.returnID());
		this.setUsernickname(this.returnNickname());
		this.setUserpicture(this.returnImageStringWithCreds());
	}
	
	public boolean checkUser() throws SQLException {
		
		String query = "select * from user where usermail = '" + this.getUsermail() + "' and userpasswd = '" + this.getUserpasswd() + "'";
		
		ResultSet rs = dbQuery.query(query);
		
		System.out.println(query);
		
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
		
		
		
	}
	
	public int returnID() throws NumberFormatException, SQLException {
		String query = "select userid from user where usermail = '" + this.getUsermail() + "' and userpasswd = '" + this.getUserpasswd() + "'";
		
		ResultSet rs = dbQuery.query(query);
		
		if (!rs.next()) {
			return -1;
		} else {
			return Integer.parseInt(rs.getString("userid"));
		}
	}
	
	public String returnNickname() throws SQLException {
		String query = "select usernickname from user where usermail = '" + this.getUsermail() + "' and userpasswd = '" + this.getUserpasswd() + "'";
		
		ResultSet rs = dbQuery.query(query);
		
		rs.next();
		return rs.getString("usernickname");
	}
	
	public String returnImageStringWithID() throws SQLException {
		String query = "select userpicture from user where userid = '" + getUserid() + "'";
		
		ResultSet rs = dbQuery.query(query);
		
		rs.next();
		return rs.getString("userpicture");
	}
	
	public String returnImageStringWithCreds() throws SQLException {
		String query = "select userpicture from user where usermail = '" + this.getUsermail() + "' and userpasswd = '" + this.getUserpasswd() + "'";
		
		ResultSet rs = dbQuery.query(query);
		
		rs.next();
		return rs.getString("userpicture");
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getUserid()+"",
				this.getUsernickname(),
				this.getUsermail(),
				this.getUserpasswd(),
				this.getUserpicture()
		};
		return(temp);
	}
	
	
	public void sendUserMail( String mailFrom, String mailTo, String mailSubject, String mailBody ){
		
		String smtpHost = "localhost"; 
		String smtpPort = "25"; 
		String username = "";
		String password = "";
		String auth     = "";  
		
		SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );		
		sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
		
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsernickname() {
		return usernickname;
	}
	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	public String getUserpicture() {
		return userpicture;
	}
	public void setUserpicture(String userpicture) {
		this.userpicture = userpicture;
	}
	
}

package gym;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class DBCode {
    //Server Data
	String url="jdbc:mysql://localhost:3306/gym";
	String user="root";
	String pass="accord";
	
	private Connection con;
	public DBCode() throws SQLException,ClassNotFoundException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
	}
	// Inserting values into Regisrtation Table
	public int add(String fname, String lname, String gender, int age, String address, String contactNo, String email, String password,String date,String time) throws SQLException {
	int r=0;
	String q="insert into registration(Fname,Lname,Gender,Age,Address,ContactNo,Email,Password,Date,Time)values(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pst=con.prepareStatement(q);
	pst.setString(1,fname);
	pst.setString(2, lname);
	pst.setString(3, gender);
	pst.setInt(4, age);
	pst.setString(5, address);
	pst.setString(6, contactNo);
	pst.setString(7, email);
	pst.setString(8, password);
	pst.setString(9, date);
	pst.setString(10, time);
	r=pst.executeUpdate();
	return r;
	}
	// Method to view All the Details.
	public Vector<Registration> view()throws SQLException{
		Vector<Registration> vt=new Vector<Registration>();
		String q="select *from registration";
		PreparedStatement pst=con.prepareStatement(q);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("Id");
			String fname=rs.getString("Fname");
			String lname=rs.getString("Lname");
			String gender=rs.getString("Gender");
			int age=rs.getInt("Age");
			String address=rs.getString("Address");
			String contactNo=rs.getString("ContactNo");
			String email=rs.getString("Email");
			String password=rs.getString("Password");
			String date=rs.getString("Date");
			String time=rs.getString("Time");
			Registration  r=new Registration(id, fname, lname, gender, age, address, contactNo, email,password,date,time);
			vt.add(r);
		}		
		return vt;
	}
	// MEthod to Edit user details
	public int edit(int id,String fname, String lname, String gender, int age, String address,String contactNo,String email, String password) throws SQLException{
		int r=0;
		String q="update registration set Fname=?,Lname=?,Gender=?,Age=?,Address=?,ContactNo=?,Email=?,Password=? where Id=?";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setString(1,fname);
		pst.setString(2,lname);
		pst.setString(3,gender);
		pst.setInt(4,age);
		pst.setString(5,address);
		pst.setString(6,contactNo);	
		pst.setString(7,email);
		pst.setString(8,password);
		pst.setInt(9,id);
		r=pst.executeUpdate();
		return r;
	}
	//Method to delete user details
	public int delete(int id) throws SQLException{
		int r=0;
		String q="delete from registration where Id=?";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setInt(1,id);
		r=pst.executeUpdate();
		return r;
	}
	//Method to view user details by using Specific Id
	public Vector<Registration> specific(int id)throws SQLException{
		Vector<Registration> vt=new Vector<Registration>();
		String q="select *from registration where id=?";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			int id1=rs.getInt("Id");
			String fname=rs.getString("Fname");
			String lname=rs.getString("Lname");
			String gender=rs.getString("Gender");
			int age=rs.getInt("Age");
			String address=rs.getString("Address");
			String contactNo=rs.getString("ContactNo");
			String email=rs.getString("Email");
			String password=rs.getString("Password");
			String date=rs.getString("Date");
			String time=rs.getString("Time");
			Registration  r=new Registration(id1, fname, lname, gender, age, address, contactNo, email,password,date,time);
			vt.add(r);
		}		
		return vt;
	}
	//User Registration Validation
	public int Validation(String address,String ContactNo,String email ) throws SQLException {
		int r=0;
		String q="select Address,ContactNo,Email from registration";
		PreparedStatement pst=con.prepareStatement(q);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			String address1=rs.getString(1);
			String ContactNo1=rs.getString(2);
			String email1=rs.getString(3);
			if(address1.equals(address)) {
				r=1;
				break;
			}else if(ContactNo1.equals(ContactNo)) {
				r=2;
				break;
			}else if(email1.equals(email) ) {
				r=3;
				break;
			}
		}
		return r;
		}
	//Method to validate Admin Registration
	public int ShowRecords(){ 
		int r=0;
		try {
		String q="select *from admin";
		PreparedStatement pst=con.prepareStatement(q);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			r++;
		   }
		 }catch(SQLException e) {System.out.println(e);}
		return r;
	}
	//Inserting  Admin Values
	public int AdminValues(String user,String pass) throws SQLException
	{ 
	 int r=0;
			String q="insert into admin(Uname,Pass)values(?,?)";
			//create Statement
			PreparedStatement pst=con.prepareStatement(q);
			//submitting the inputs
			pst.setString(1,user);
			pst.setString(2,pass);
			//Execute Query
			r=pst.executeUpdate();
		return r;
	}
	//Validation Code for Admin
	public int login(String u,String p) throws SQLException {
		int r=0;
				String q="select *from admin";
				PreparedStatement pst=con.prepareStatement(q);
				ResultSet rs=pst.executeQuery();
				String u1 = null,p1 = null;
				while(rs.next()) {
					 u1=rs.getString("Uname");
					 p1=rs.getString("Pass");
				}
				if(u.equals(u1)&&p.equals(p1)) {r=1;}
				return r;
	}
	//User Validation
	public int Userlogin(String u,String p) throws SQLException {
		int r=0;
				String q="select *from registration";
				PreparedStatement pst=con.prepareStatement(q);
				ResultSet rs=pst.executeQuery();
				String u1 = null,p1 = null;
				while(rs.next()) {
					 u1=rs.getString("ContactNo");
					 p1=rs.getString("Password");
					 if(u.equals(u1)&&p.equals(p1)) {r=1;break;}
				}
				return r;
	}
	//Getting user details from registration table and storing it in the userdetail table while login for first time in a day.
		public int UserDetail(String cn) throws SQLException {
			int r=0;
			String q="insert into userdetail(Fname,Lname,Gender,Age,Address,ContactNo,Email,Password)select Fname,Lname,Gender,Age,Address,ContactNo,Email,Password from registration where ContactNo=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,cn);
			pst.executeUpdate();
			String q1="select *from userdetail";
			PreparedStatement pst1=con.prepareStatement(q1);
			ResultSet rs=pst1.executeQuery();
			while(rs.next()) {
				r=rs.getInt("id");
			}
			return r;
		}
		// Method to view All the Details.
		public Vector<Registration> Specificview(String cn)throws SQLException{
			Vector<Registration> vt1=new Vector<Registration>();
			String q="select *from registration where ContactNo=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,cn);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				int id=rs.getInt("Id");
				String fname=rs.getString("Fname");
				String lname=rs.getString("Lname");
				String gender=rs.getString("Gender");
				int age=rs.getInt("Age");
				String address=rs.getString("Address");
				String contactNo=rs.getString("ContactNo");
				String email=rs.getString("Email");
				String password=rs.getString("Password");
				String date=rs.getString("Date");
				String time=rs.getString("Time");
				Registration  r=new Registration(id, fname, lname, gender, age, address, contactNo, email,password,date,time);
				vt1.add(r);
			}		
			return vt1;
		}
}

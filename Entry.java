package gym;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Entry {
//Server Data
		
	    String url="jdbc:mysql://localhost:3306/gym";
		String user="root";
		String pass="accord";
		
		private Connection con;
		public Entry() throws SQLException,ClassNotFoundException{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass);
		}
		DBCode db=new DBCode();

//checking entries

		public int Check(String user,String pass) throws SQLException {
		int r=0;
		String q1="select *from ulog";
	    PreparedStatement pst1=con.prepareStatement(q1);
		ResultSet rs=pst1.executeQuery();
		while(rs.next()) {
	 	 String u1=rs.getString("uname");
	     String p1=rs.getString("pass");
		 if(u1.equals(user)&&p1.equals(pass)) { 
			 r++;
			 }
	 	 }
		return r;
	   }
		
//Getting id
		
	   public int GetId(String user,String pass) throws SQLException {
			int r=0;
			String q1="select *from ulog";
		    PreparedStatement pst1=con.prepareStatement(q1);
			ResultSet rs=pst1.executeQuery();
			while(rs.next()) {
		 	 String u1=rs.getString("uname");
		     String p1=rs.getString("pass");
			 if(u1.equals(user)&&p1.equals(pass)) { 
				 r=rs.getInt("id");
				 }
		 	 }
			return r;
		   }

//Inserting  user Values
	   
		public void UlogValues(String user,String pass,String dt,String time) throws SQLException
		{
			int r=Check(user,pass);
		//Inserting date&LogInTime into userdetail.
			if(r==0)
			{
				 String q="insert into ulog(uname,pass)select ContactNo,Password from registration where ContactNo=?";
					//create Statement
					PreparedStatement pst=con.prepareStatement(q);
					//submitting the inputs
					pst.setString(1, user);
					//Execute Query
					pst.executeUpdate();
					int r0=Check(user,pass);
					if(r0==1) {
				    	db.UserDetail(user);
						//getting user id
				    	int id=GetId(user,pass);
						//getting date
						String q2=" update userdetail set Date=? where id=?";
						PreparedStatement pst2=con.prepareStatement(q2);
						pst2.setString(1,dt);
						pst2.setInt(2,id);
						pst2.executeUpdate();
						//login time
						String q3=" update userdetail set LogInTime=? where id=?";
						PreparedStatement pst3=con.prepareStatement(q3);
						pst3.setString(1,time);
						pst3.setInt(2,id);
						pst3.executeUpdate();
				    }
			}
		    //Inserting LogOutTime in userdetail.
		    else
		    {
		        //getting user id
		    	int id=GetId(user,pass);	
		    	//logout time
				String q2=" update userdetail set LogOutTime=? where id=?";
				PreparedStatement pst2=con.prepareStatement(q2);
				pst2.setString(1,time);
				pst2.setInt(2,id);
				pst2.executeUpdate();
				String q3="delete from ulog where id=?";
				PreparedStatement pst3=con.prepareStatement(q3);
				pst3.setInt(1,id);
				pst3.executeUpdate();
		    }
		}
// Method to view All the Details.
		public Vector<EntryDetails> view()throws SQLException{
			Vector<EntryDetails> vt=new Vector<EntryDetails>();
			String q="select *from userdetail";
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
				String pass=rs.getString("Password");
				String Date=rs.getString("Date");
				String In=rs.getString("LogInTime");
				String Out=rs.getString("LogOutTime");
				EntryDetails  r=new EntryDetails(id,fname, lname, gender, age, address, contactNo, email,pass,Date,In,Out);
				vt.add(r);
			}		
			return vt;
		}
//		public int Udelete(int id) throws SQLException{
//			int r=0;
//			String q="delete from userdetail where id=?";
//			PreparedStatement pst=con.prepareStatement(q);
//			pst.setInt(1,id);
//			r=pst.executeUpdate();
//			return r;
//		}
// Method to view filtered Details based on date and time.
				public Vector<EntryDetails> Filterview(String dt,String it,String ot)throws SQLException{
					Vector<EntryDetails> vt1=new Vector<EntryDetails>();
					String q="select *from userdetail where date=? and STR_TO_DATE(LogInTime, '%H:%i:%s')>= ? and STR_TO_DATE(LogOutTime, '%H:%i:%s')<= ?";
					PreparedStatement pst=con.prepareStatement(q);
					pst.setString(1,dt);
					pst.setString(2,it);
					pst.setString(3,ot);
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
						String pass=rs.getString("Password");
						String Date=rs.getString("Date");
						String In=rs.getString("LogInTime");
						String Out=rs.getString("LogOutTime");
						EntryDetails  r=new EntryDetails(id,fname, lname, gender, age, address, contactNo, email,pass,Date,In,Out);
						vt1.add(r);
					}		
					return vt1;
				}
				//find number of entries
				public int Findentries(String dt,String it,String ot) throws SQLException {
					int r=0;
					String q="select *from userdetail where date=? and STR_TO_DATE(LogInTime, '%H:%i:%s')>= ? and STR_TO_DATE(LogOutTime, '%H:%i:%s')<= ?";
					PreparedStatement pst=con.prepareStatement(q);
					pst.setString(1,dt);
					pst.setString(2,it);
					pst.setString(3,ot);
					ResultSet rs=pst.executeQuery();
					while(rs.next()) {
						r++;
					}		
					return r;
				}
}

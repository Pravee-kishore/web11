package gym;

public class Registration {
	int Id;
	String Fname;
	String Lname;
	String Gender;
	int Age;
	String Address;
	String ContactNo;
	String Email;
	String Password;
	String Date;
	String Time;
	public Registration(int id, String fname, String lname, String gender, int age, String address, String contactNo, String email, String password,String date,String time) {
		super();
		this.Id = id;
		Fname = fname;
		Lname = lname;
		Gender = gender;
		Age = age;
		Address=address;
		ContactNo=contactNo;
		Email = email;
		Password = password;
		Date=date;
		Time=time;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		this.Id = id;
	}
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public String getLname() {
		return Lname;
	}
	public void setLname(String lname) {
		Lname = lname;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		Email = contactNo;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		this.Date = date;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		this.Time = time;
	}
}

package gym;

public class EntryDetails {
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
	String In;
	String Out;
	public EntryDetails(int id, String fname, String lname, String gender, int age, String address, String contactNo,
			String email, String password, String date, String in, String out) {
		super();
		Id = id;
		Fname = fname;
		Lname = lname;
		Gender = gender;
		Age = age;
		Address = address;
		ContactNo = contactNo;
		Email = email;
		Password = password;
		Date = date;
		In = in;
		Out = out;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
		ContactNo = contactNo;
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
		Date = date;
	}
	public String getIn() {
		return In;
	}
	public void setIn(String in) {
		In = in;
	}
	public String getOut() {
		return Out;
	}
	public void setOut(String out) {
		Out = out;
	}
	
	
}

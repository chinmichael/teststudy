package DBPKG;

public class SellVO {
	
	int custno;
	String custname;
	String grade;
	int sale;
	
	SellVO (int custno, String custname, String grade, int sale) {
		
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.sale = sale;
		
	}
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	
	
}

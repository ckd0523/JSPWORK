package mvc.model;

public class RepleDTO {
	
	private int num;			//댓글 번호
	private int replenum;		//게시글 번호
	private String id;			//댓글 아이디
	private String reple;		//댓글 내용
	private String regist_day;	//댓글 등록 일자




public RepleDTO() {
	super();		
}




public int getNum() {
	return num;
}




public void setNum(int num) {
	this.num = num;
}




public int getReplenum() {
	return replenum;
}




public void setReplenum(int replenum) {
	this.replenum = replenum;
}




public String getId() {
	return id;
}




public void setId(String id) {
	this.id = id;
}




public String getReple() {
	return reple;
}




public void setReple(String reple) {
	this.reple = reple;
}




public String getRegist_day() {
	return regist_day;
}




public void setRegist_day(String regist_day) {
	this.regist_day = regist_day;
}

}
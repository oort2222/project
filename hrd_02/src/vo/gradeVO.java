package vo;

public class gradeVO {
	private String membernum;
	private String member;
	private int math;
	private int eng;
	private int lang;
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getLang() {
		return lang;
	}
	public void setLang(int lang) {
		this.lang = lang;
	}
	@Override
	public String toString() {
		return "gradeVO [membernum=" + membernum + ", member=" + member + ", math=" + math + ", eng=" + eng + ", lang="
				+ lang + "]";
	}
	
}
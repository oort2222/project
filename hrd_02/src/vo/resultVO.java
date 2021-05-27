package vo;

public class resultVO {
	private String membernum;
	private String member;
	private int result;
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
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "resultVO [membernum=" + membernum + ", member=" + member + ", result=" + result + "]";
	}
}

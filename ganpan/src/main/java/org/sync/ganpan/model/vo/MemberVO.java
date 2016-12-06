package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * @author JYM
 *
 */
public class MemberVO {
	private String nickName;
	private String eMail;
	private String password;

	public MemberVO() {
		super();
	}

	public MemberVO(String nickName, String eMail, String password) {
		super();
		this.nickName = nickName;
		this.eMail = eMail;
		this.password = password;
	}

	public MemberVO(String nickName) {
		this.nickName = nickName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "MemberVO [nickName=" + nickName + ", eMail=" + eMail + ", password=" + password + "]";
	}
}
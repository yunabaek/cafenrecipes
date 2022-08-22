package kr.co.cafenrecipes.dao;

import java.util.HashMap;

import kr.co.cafenrecipes.dto.MemberDTO;

public interface MemberDAO {

	String login(String id, String pw);

	int join(MemberDTO dto);

	String findid(String name, String birth, String email);

	String findpw(String id, String birth, String email);

	MemberDTO myprofile(String loginId);

	int profileUpdate(HashMap<String, String> userupdate);
}

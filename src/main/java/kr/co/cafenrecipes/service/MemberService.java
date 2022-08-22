package kr.co.cafenrecipes.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cafenrecipes.dao.MemberDAO;
import kr.co.cafenrecipes.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberdao;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public String login(String id, String pw) {

		String loginId = null;
		loginId = memberdao.login(id, pw);

		return loginId;
	}
	
	public String join(MemberDTO dto) {
		logger.info("회원가입 서비스 도착");
		String page = "joinForm";
		if (memberdao.join(dto) > 0) {
			page = "loginForm";
		}
		return page;
	}

	public String findid(String name, String birth, String email) {
		return memberdao.findid(name, birth, email);
	}
	
	public String findpw(String id, String birth, String email) {
		return memberdao.findpw(id, birth, email);
	}

	public MemberDTO myprofile(String loginId) {
		MemberDTO myProfile = memberdao.myprofile(loginId);

		return myProfile;
	}

	public HashMap<String, Object> profileUpdate(HashMap<String, String> userupdate) {
		logger.info("파라메터 서비스 도착여부 {}", userupdate);
		int row = memberdao.profileUpdate(userupdate);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		logger.info("성공여부 확인: {}", row);

		return map;
	}

}

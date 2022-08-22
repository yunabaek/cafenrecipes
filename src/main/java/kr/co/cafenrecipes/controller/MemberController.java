package kr.co.cafenrecipes.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipes.dto.MemberDTO;
import kr.co.cafenrecipes.service.MemberService;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MemberService memberservice;

	/* 첫 화면 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	/* 인덱스 페이지 이동 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "index";
	}

	/* 로그인 페이지로 이동 */
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 페이지로 이동");
		return "loginForm";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		logger.info("로그인 요청");
		logger.info(id + "/" + pw);

		String page = "redirect:/";

		String loginId = memberservice.login(id, pw);

		if (loginId != null) {
			page = "redirect:/listForm";
			session.setAttribute("loginId", loginId);
		}
		return page;

	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {

		session.removeAttribute("loginId");
		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject("msg", "로그아웃이 완료 되었습니다.");
		return mav;

	}

	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		logger.info("회원가입 페이지 이동 ");
		return "joinForm";
	}

	/* 회원가입 */
	@RequestMapping(value = "/join")
	public String join(@ModelAttribute MemberDTO dto) {
		logger.info("회원가입 요청");
		logger.info("dto:{}", dto.getId());
		return memberservice.join(dto);
	}

	/* id찾기 페이지 이동 */
	@RequestMapping(value = "/idfind")
	public String idfind() {
		logger.info("idfind page 이동");
		return "idfind";

	}

	/* id찾기 */
	@RequestMapping(value = "/findid")
	@ResponseBody
	public HashMap<String, Object> findid(@RequestParam String name, @RequestParam String birth, @RequestParam String email, Object id, HttpSession session) {
		logger.info("로그인 체크:{} / {}", name, birth);

		String success = memberservice.findid(name, birth, email);
		logger.info("아이디 찾기 여부 성공:{}", success);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (success != null) {
			map.put("success", success);
		} else {
			map.put("success", "아이디 정보가 없습니다.");
		}
		return map;
	}

	/* pw찾기 페이지 이동 */
	@RequestMapping(value = "/pwfind")
	public String pwfind() {
		logger.info("pwfind page 이동");
		return "pwfind";

	}

	/* pw찾기 */
	@RequestMapping(value = "/findpw")
	@ResponseBody
	public HashMap<String, Object> findpw(@RequestParam String id, @RequestParam String birth, @RequestParam String email) {

		logger.info("비밀번호 확인시 필수 정보 체크:{}", id);
		String success = memberservice.findpw(id, birth, email);
		logger.info("비밀번호 찾기 여부 성공:{}", success);

		HashMap<String, Object> map = new HashMap<String, Object>();

		if (success != null) {
			map.put("success", success);
		} else {
			map.put("success", "일치하는 정보가 없습니다.");
		}
		return map;
	}

	/* 회원정보수정 가져오기 */
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public String myProfile(Model model, HttpSession session) {
		logger.info("myProfile 요청");
		String loginId = (String) session.getAttribute("loginId");
		MemberDTO myProfile = memberservice.myprofile(loginId);
		model.addAttribute("myProfile", myProfile);

		return "myProfile";
	}

	/* 회원정보 업데이트 */
	@RequestMapping(value = "/profileupdate", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> profileupdate(@RequestParam HashMap<String, String> userupdate) {
		logger.info("프로필 업데이트 요청을 받았습니다. {}", userupdate);
		return memberservice.profileUpdate(userupdate);
	}

}

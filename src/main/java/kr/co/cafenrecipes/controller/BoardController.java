package kr.co.cafenrecipes.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipes.dto.BoardDTO;
import kr.co.cafenrecipes.dto.PhotoDTO;
import kr.co.cafenrecipes.service.BoardService;

@Controller
public class BoardController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	BoardService boardservice;

	/* 404 */
	@RequestMapping(value = "/error/404", method = RequestMethod.GET)
	public String notfound(Model model) {
		logger.info("404 error 발생!");
		model.addAttribute("code", "404");
		model.addAttribute("msg", "원하시는 페이지를 찾지 못했습니다.");

		return "error";
	}

	/* 리스트 페이지 이동 */
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) {
		logger.info("listForm 이동");
		return "listForm";
	}

	/* 리스트 + 페이징 */
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public HashMap<String, Object> list(Model model, @RequestParam String page, @RequestParam String cnt) {
		logger.info("list 요청:{} 페이지,{}개씩", page, cnt);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		return boardservice.list(currPage, pagePerCnt);
	}

	/* 글쓰기 페이지 이동 */
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		logger.info("writeForm 이동");
		return "writeForm";
	}

	/* 글 쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(MultipartFile[] photos, @RequestParam HashMap<String, String> params) {
		logger.info("글쓰기 페이지 요청", params);
		logger.info("업로드 할 파일 수 : {}", photos.length);
		return boardservice.write(photos, params);

	}

	/* 글 상세 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String idx) {

		logger.info("상세보기 : {}", idx);

		// 게시글 가져오기
		BoardDTO dto = boardservice.detail(idx);
		logger.info("reg_date : {}", dto.getReg_date());
		model.addAttribute("dto", dto);
		ArrayList<PhotoDTO> photos = boardservice.photoList(idx);
		logger.info("사진 수 :{}", photos.size());
		model.addAttribute("photos", photos);
		logger.info("사진 {}", photos);
		return "detail";
	}

	/* 글 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam String idx) {
		logger.info("삭제 : {}", idx);
		boardservice.delete(idx);
		return "redirect:/listForm";
	}

	/* 글 수정 페이지로 이동 */
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam String idx) {
		logger.info("updateForm: {} ", idx);
		return boardservice.updateForm(model, idx);

	}

	/* 글 수정 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam HashMap<String, String> params) {
		logger.info("update 요청 : {}", params);
		boardservice.update(params);
		return "redirect:/detail?idx=" + params.get("idx");
	}

	/* 검색 */
	@RequestMapping(value = "/search")
	public ModelAndView search(@RequestParam HashMap<String, String> params) {
		logger.info("검색 요청");
		logger.info("params:{}", params);
		return boardservice.search(params);

	}

}

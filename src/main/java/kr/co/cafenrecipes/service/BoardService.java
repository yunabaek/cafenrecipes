package kr.co.cafenrecipes.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cafenrecipes.dao.BoardDAO;
import kr.co.cafenrecipes.dto.BoardDTO;
import kr.co.cafenrecipes.dto.PhotoDTO;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	BoardDAO boarddao;

	/* 리스트 페이징 */
	public HashMap<String, Object> list(int currPage, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int offset = ((currPage - 1) * pagePerCnt) - 1 >= 0 ? ((currPage - 1) * pagePerCnt - 1) : 0;
		logger.info("offset:{}", offset);

		int totalCount = boarddao.allCount();
		int range = totalCount % pagePerCnt > 0 ? (totalCount / pagePerCnt) + 1 : (totalCount / pagePerCnt);

		logger.info("총 갯수 : {}", totalCount);
		logger.info("만들 수 있는 총 페이지 : {}", range);

		map.put("pages", range);
		map.put("list", boarddao.list(pagePerCnt, offset));
		return map;
	}

	/* 글쓰기란 사진추가 */
	public String write(MultipartFile[] photos, HashMap<String, String> params) {
		String page = "redirect:/";
		BoardDTO dto = new BoardDTO();
		dto.setSubject(params.get("subject"));
		dto.setName(params.get("name"));
		dto.setContent(params.get("content"));
		boarddao.write(dto);

		int idx = dto.getIdx();
		logger.info("idx : " + idx);
		if (idx > 0) {
			page = "redirect:/detail?idx=" + idx;
			saveFile(idx, photos);
		}

		return page;
	}

	/* 사진저장 */
	private void saveFile(int idx, MultipartFile[] photos) {
		for (MultipartFile photo : photos) {

			try {
				String oriFileName = photo.getOriginalFilename();
				int index = oriFileName.lastIndexOf(".");
				logger.info("index : {}", index);

				if (index > 0) {
					String ext = oriFileName.substring(index);
					String newFileName = System.currentTimeMillis() + ext;
					logger.info(oriFileName + " => " + newFileName);

					byte[] bytes = photo.getBytes();
					Path path = Paths.get("C:/upload/" + newFileName);
					Files.write(path, bytes);
					logger.info(oriFileName + " SAVE OK!!");
					boarddao.fileWrite(idx, oriFileName, newFileName);
				}

				Thread.sleep(1);
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
		}

	}

	/* 포토 가져오기 */
	public ArrayList<PhotoDTO> photoList(String idx) {
		return boarddao.photoList(idx);
	}

	/* 글 상세보기 */
	public BoardDTO detail(String idx) {
		BoardDTO dto = null;
		int success = boarddao.upHit(idx);

		if (success > 0) {
			logger.info("success :{}", success);
			dto = boarddao.detail(idx);
		}
		return dto;
	}

	/* 글 삭제 */
	public void delete(String idx) {
		int success = boarddao.delete(idx);
		logger.info("삭제 완료 여부 : " + success);
	}

	/* 글 수정 */
	public void update(HashMap<String, String> params) {
		int row = boarddao.update(params);
		logger.info("수정 성공여부 : {}", row);
	}

	/* 수정 할 글 가져오기 */
	public String updateForm(Model model, String idx) {
		logger.info("service 동작");
		BoardDTO dto = boarddao.detail(idx);
		ArrayList<PhotoDTO> list = boarddao.photoList(idx);

		logger.info("subject : " + dto.getSubject());
		logger.info("photos : {}", list);

		model.addAttribute("dto", dto);
		model.addAttribute("photos", list);

		return "updateForm";
	}

	/* 검색 */
	public ModelAndView search(HashMap<String, String> params) {

		ModelAndView mav = new ModelAndView();

		ArrayList<BoardDTO> lists = boarddao.search(params);
		mav.addObject("lists", lists);
		logger.info("mav:{}", mav);

		mav.setViewName("reserch");

		return mav;

	}

}

package kr.co.cafenrecipes.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.cafenrecipes.dto.BoardDTO;
import kr.co.cafenrecipes.dto.PagingDTO;
import kr.co.cafenrecipes.dto.PhotoDTO;

public interface BoardDAO {

	ArrayList<PagingDTO> list(int pagePerCnt, int offset);

	int allCount();

	void write(BoardDTO dto);

	int upHit(String idx);

	BoardDTO detail(String idx);

	int delete(String idx);

	int update(HashMap<String, String> params);

	void fileWrite(int idx, String oriFileName, String newFileName);

	void fileWrite(String idx, String oriFileName, String newFileName);

	ArrayList<PhotoDTO> photoList(String idx);

	ArrayList<BoardDTO> search(HashMap<String, String> params);
	
}

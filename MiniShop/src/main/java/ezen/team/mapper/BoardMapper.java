package ezen.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.BoardDTO;
import ezen.team.domain.CsDTO;

//BoardServiceImple과 연결

@Mapper
public interface BoardMapper {

	public void csInsert(CsDTO csDto);

	//notice 모두 가져오기
	public List<BoardDTO> getNoticeList();

}

package ezen.team.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import ezen.team.domain.CsDTO;
import ezen.team.domain.PageDTO;

@Mapper
public interface CustomerMapper {
	
	List<CsDTO> csList(String cs_code, String proc_sts);

	CsDTO csInfo(int cs_no, int proc_sts);
	
	CsDTO itemName(String cs_code);

	void csReply(@Param("cs_no")int cs_no, @Param("csre_con")String csre_con, @Param("proc_id")String proc_id);

}

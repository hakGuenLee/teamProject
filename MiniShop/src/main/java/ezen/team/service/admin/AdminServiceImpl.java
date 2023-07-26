package ezen.team.service.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.team.domain.AdminDTO;
import ezen.team.domain.CommonCodeDTO;
import ezen.team.domain.EmpDTO;
import ezen.team.mapper.admin.AdminMapper;

//AdminController와 연결

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;
	
	
	//관리자 권한 코드 가져오기
	@Override
	public List<CommonCodeDTO> getAdminRole() {
		
		List<CommonCodeDTO> list = mapper.getAdminRole();
		
		return list;
	}
	
	//사용구분 코드 가져오기
	@Override
	public List<CommonCodeDTO> getUseCode() {
		List<CommonCodeDTO> list = mapper.getUseCode();
		
		return list;
	}
	
	
	//관리자 등록
	@Override
	public void adminRegister(AdminDTO aDto) {
		mapper.adminRegister(aDto);		
		
	}

	//관리자 등록 페이지 사번 검색하기
	@Override
	public EmpDTO getEmpList(String name) {
		
		EmpDTO eDto = mapper.getEmp(name);	
		
		return eDto;
	}

	//관리자 리스트 가져오기
	@Override
	public List<AdminDTO> getAdminList() {
		
		List<AdminDTO> list = mapper.getAdminList();
		
		return list;
	}

	//관리자 삭제
	@Override
	public void adminDelete(String id) {
		mapper.adminDelete(id);
		
	}

	//수정할 관리자 정보 가져오기
	@Override
	public AdminDTO getAdminInfo(String id) {
		AdminDTO adminDto = mapper.getAdminInfo(id);
		
		
		return adminDto;
	}

	//관리자 정보 수정 처리하기
	@Override
	public void adminUpdate(AdminDTO aDto) {
		mapper.adminUpdate(aDto);
		
	}





}

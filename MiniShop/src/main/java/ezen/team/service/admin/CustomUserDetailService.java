//package ezen.team.service.admin;
//
//import java.util.ArrayList;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import ezen.team.domain.AdminDTO;
//import ezen.team.mapper.admin.AdminMapper;
//import ezen.team.security.common.AdminContext;
//
//
/////사용자의 정보를 가져오는 인터페이스(userDetailsService)를 구현한 서비스
//
//@Service("userDetailsService")
//public class CustomUserDetailService implements UserDetailsService {
//
//	@Autowired
//	AdminMapper adminMapper;
//	
//	
//	@Override
//	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
//		
//		//DB로부터 관리자 정보 가져오기
//		AdminDTO aDto = adminMapper.findByusername(id);
//		
//		//해당 아이디가 없을 경우
//		if(aDto == null) {
//			throw new UsernameNotFoundException("Not Found : " + id);
//		}
//		
//		ArrayList<GrantedAuthority> roles = new ArrayList<>();
//		roles.add(new SimpleGrantedAuthority(aDto.getRole()));
//		
//		AdminContext adminContext = new AdminContext(aDto, id, id, roles);
//		
//		return adminContext;
//	}
//
//}

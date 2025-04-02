package com.test.Urban_Village.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.test.Urban_Village.dto.MemberDTO;

@Repository
public class MemberDAO {
	
@Autowired
public  SqlSession sqlSession;

	public List<MemberDTO> listMembers() {
		// TODO Auto-generated method stub
		List<MemberDTO> membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}


	public MemberDTO login(MemberDTO member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.login", member);
	}

}

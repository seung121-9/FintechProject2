package com.test.Urban_Village.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.Urban_Village.member.dao.MemberDAOImpl;
import com.test.Urban_Village.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
		@Autowired
		private MemberDAOImpl dao;
		
	
		public List<MemberDTO> listMembers() {
			// TODO Auto-generated method stub
			return dao.listMembers();
		}


		public MemberDTO login(String id, String pwd) {
		    MemberDTO member = new MemberDTO();
		    member.setId(id);
		    member.setPwd(pwd);
		    return dao.login(member); // DB���� �ش� ������ ��ȸ
		}


	

	}

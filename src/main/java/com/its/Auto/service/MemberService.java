package com.its.Auto.service;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO){memberRepository.save(memberDTO);}

    public String emailCk(String memberEmail){return memberRepository.emailCk(memberEmail);}

    public MemberDTO login(MemberDTO memberDTO){
    return memberRepository.login(memberDTO);
    }

    public MemberDTO detail(Long id){return memberRepository.detail(id);}

    public boolean update(MemberDTO memberDTO){
       int result= memberRepository.update(memberDTO);
       if(result >= 1) {
           return true;
       }else{
           return false;
       }

    }
    public List<member_resDTO> list(Long id){ return memberRepository.list(id);}

    public void delete(Long id) {  memberRepository.delete(id);
    }
}

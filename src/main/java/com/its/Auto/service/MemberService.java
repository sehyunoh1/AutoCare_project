package com.its.Auto.service;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO){memberRepository.save(memberDTO);}

    public String emailCk(String memberEmail){return memberRepository.emailCk(memberEmail);}

}

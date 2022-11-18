package com.its.Auto.repository;

import com.its.Auto.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO){sql.insert(("member.save"),memberDTO);}

    public String emailCk(String memberEmail) { return sql.selectOne(("member.emailCk"),memberEmail);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne(("member.login"),memberDTO);
    }

    public MemberDTO detail(Long id){return sql.selectOne(("member.detail"),id);}
    public int update(MemberDTO memberDTO){return sql.update(("member.update"),memberDTO);}
}

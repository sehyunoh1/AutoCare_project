package com.its.Auto.repository;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public List<member_resDTO> list(Long id){return sql.selectList(("member.list"),id);}

    public void delete(Long id) { sql.delete(("member.delete"),id);
    }
}


package com.its.Auto.repository;

import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReservationRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(ReservationDTO reservationDTO){sql.insert(("reservation.save"),reservationDTO);}


    public List<member_resDTO> list() { return sql.selectList(("reservation.list"));
    }

    public member_resDTO detail(Long resId) { return sql.selectOne(("reservation.detail"),resId);
    }

    public int fin(member_resDTO finish) { return sql.update(("reservation.fin"),finish);
    }

    public int notification (Long id) {return sql.selectOne(("reservation.notify"),id);}

    public List<member_resDTO> sort(member_resDTO DTO) { return sql.selectList(("reservation.sort"),DTO);
    }
}

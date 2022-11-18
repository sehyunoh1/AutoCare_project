package com.its.Auto.repository;

import com.its.Auto.dto.ReservationDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReservationRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(ReservationDTO reservationDTO){sql.insert(("reservation.save"),reservationDTO);}


}

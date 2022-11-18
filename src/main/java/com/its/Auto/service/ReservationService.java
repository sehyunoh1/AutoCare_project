package com.its.Auto.service;

import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public void save(ReservationDTO reservationDTO){ reservationRepository.save(reservationDTO);};


}

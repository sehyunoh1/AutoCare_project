package com.its.Auto.service;

import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public void save(ReservationDTO reservationDTO){ reservationRepository.save(reservationDTO);};

    public List<member_resDTO> list() { return reservationRepository.list();
    }


    public member_resDTO detail(Long resId) { return reservationRepository.detail(resId);
    }

    public boolean fin(Long resId) {
        int result = reservationRepository.fin(resId);
        if(result >= 1){
            return true;
        }else {
            return false;
        }
    }

    public int notification(Long id) { return reservationRepository.notification(id);
    }
}

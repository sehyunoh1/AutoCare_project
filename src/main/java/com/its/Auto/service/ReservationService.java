package com.its.Auto.service;

import com.its.Auto.commons.PagingConst;
import com.its.Auto.dto.PagingDTO;
import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public void save(ReservationDTO reservationDTO){ reservationRepository.save(reservationDTO);};

    public List<member_resDTO> list(int page) {
        int pageStart = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String,Integer> pagingParams = new HashMap<>();
        pagingParams.put("start",pageStart);
        pagingParams.put("Limit",PagingConst.PAGE_LIMIT);
        List<member_resDTO> pageList =reservationRepository.pagingList(pagingParams);
        return pageList;
    }


    public member_resDTO detail(Long resId) { return reservationRepository.detail(resId);
    }

    public String fin(member_resDTO finish) {
        int result = reservationRepository.fin(finish);
        if(result >= 1){
            return finish.getFin();
        }else {
            return null;
        }
    }

    public int notification(Long id) { return reservationRepository.notification(id);
    }

    public List<member_resDTO> sort(member_resDTO DTO) { return reservationRepository.sort(DTO);
    }

    public PagingDTO pagingParam(int page) {
        int resCount =reservationRepository.boardcount(); //
        int maxPage = (int)(Math.ceil((double) resCount / PagingConst.PAGE_LIMIT));
        int startPage = ((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))-1) * PagingConst.BLOCK_LIMIT +1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PagingDTO pageDTO=new PagingDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
}

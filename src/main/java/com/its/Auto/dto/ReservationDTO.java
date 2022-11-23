package com.its.Auto.dto;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDTO {
    private Long resId;
    private String category;
    private String subcategory;
    private String detail;
    private String serviceCenter;
    private String serviceDate;
    private Timestamp serviceTime;
    private boolean delivery;
    private String fin;
    private Long memberId;
}

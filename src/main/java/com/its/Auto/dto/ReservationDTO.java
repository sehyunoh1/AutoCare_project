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
    private Timestamp serviceDate;
    private Timestamp serviceTime;
    private boolean delivery;
    private Long memberId;
}
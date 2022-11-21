package com.its.Auto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class member_resDTO {
    private Long id;
    private Long resId;
    private Long memberId;
    private String memberName;
    private String memberMobile;
    private String carModel;
    private String carYear;
    private String carNumber;
    private String category;
    private String subcategory;
    private String detail;
    private String delivery;
    private String serviceDate;
    private String serviceTime;
}

package com.its.Auto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingDTO {
private int page;
private int maxPage;
private int startPage;
private int endPage;
}

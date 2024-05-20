package com.example.demo.bookrequest;

import java.util.List;

import lombok.Data;

@Data
public class RequestMstVO {

    private int rowCount;                   // 게시물의 전체 개수
    private List<RequestVO> requestList;    // 게시물의 리스트 (최대 개수 : 5 ==> rowsPerPage)
    
}

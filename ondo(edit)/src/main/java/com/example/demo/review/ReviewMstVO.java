package com.example.demo.review;

import java.util.List;

import lombok.Data;

@Data
public class ReviewMstVO {

    private int rowCount;                   // 리뷰 게시판에 속한 데이터 전체 개수
    private List<ReviewTblVO> reviewList;   // 리뷰 리스트
    
}

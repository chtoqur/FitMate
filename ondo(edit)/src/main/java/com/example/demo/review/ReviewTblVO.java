package com.example.demo.review;

import lombok.Data;

@Data
public class ReviewTblVO {

    // 설계 속성
    private int page;
    private int rowsPerPage;

    // 기본 속성
    private String rowNum;
    private String seq;
    private String title;
    private String content;
    private String regDate;
    private String userId;
    private String isbn;
    private String viewCount;

}

package com.example.demo.notice;

import lombok.Data;

@Data
public class NoticeVO {

    // 설계속성
    private int page;
    private int rowsPerPage;
    
    private String rowNum;
    private String seq;     // 순번
    private String userId;  // 사용자아이디
    private String title;   // 제목
    private String content; // 내용
    private String writer;  // 작성자
    private String wrdate;  // 작성일
    private String divi;    // 구분
    private String views;   // 조회수

}

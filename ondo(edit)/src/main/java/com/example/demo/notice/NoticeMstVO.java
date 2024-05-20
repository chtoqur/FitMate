package com.example.demo.notice;

import java.util.List;

import lombok.Data;

@Data
public class NoticeMstVO {
    
    private int rowCount;                   // 게시물의 전체 개수
    private List<NoticeVO> noticeList;      // 게시물의 리스트 (최대 개수 : 5 ==> rowsPerPage)

}

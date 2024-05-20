package com.example.demo.bookrequest;

import lombok.Data;

@Data
public class RequestVO {

    // 설계속성
    private int page;
    private int rowsPerPage;
    
    private String title;	    //	책 제목
    private String author;	    //	저자 이름
    private String discount;	//	판매 가격. 가격이 없으면 값을 반환X
    private String publisher;	//	출판사
    private String isbn;	    //	ISBN
    private String pubdate;	    //	출간일
    private String note;        //  비고
    private String userId;      //  사용자 아이디
    private String reqdate;     //  신청일
    private String seq;         //  순번
    private String procResult;  //  처리결과
    private String procDate;    //  처리일
}

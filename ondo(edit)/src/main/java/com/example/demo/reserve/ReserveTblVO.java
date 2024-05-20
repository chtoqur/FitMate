package com.example.demo.reserve;

import com.example.demo.book.BookVO;

import lombok.Data;

@Data
public class ReserveTblVO {
    
    private String brCode;
    private String seq;
    private String userId;
    private String isbn;
    private String rsDate;

    private BookVO book;
}

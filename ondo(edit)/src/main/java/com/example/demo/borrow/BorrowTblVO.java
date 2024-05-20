package com.example.demo.borrow;

import com.example.demo.book.BookVO;

import lombok.Data;

@Data
public class BorrowTblVO {

    private String brCode;
    private String isbn;
    private String title;
    private String userId;
    private String brDate;
    private String dueDate;
    private String renew;

    private BookVO book;

}

package com.example.demo.comment;

import lombok.Data;

@Data
public class CommentTblVO {

    private String regDate;
    private String userId;
    private String comments;
    private String isbn;
    private String rating;
    
}
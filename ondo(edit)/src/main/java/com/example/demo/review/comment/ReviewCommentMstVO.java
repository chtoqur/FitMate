package com.example.demo.review.comment;

import java.util.List;

import lombok.Data;

@Data
public class ReviewCommentMstVO {

    private int commentCount;
    private List<ReviewCommentTblVO> commentList;
    
}

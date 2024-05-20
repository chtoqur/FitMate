package com.example.demo.review.comment;

import lombok.Data;

@Data
public class ReviewCommentTblVO {

    private String replyToUserId;

    private String seq;
    private String userId;
    private String reviewCode;
    private String comments;
    private String regDate;
    private String regOrder;
    private String replyLev;
    private String replyTo;
    private String sortOrder;

}

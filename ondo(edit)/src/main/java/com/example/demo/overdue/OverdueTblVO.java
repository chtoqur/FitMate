package com.example.demo.overdue;

import lombok.Data;

@Data
public class OverdueTblVO {
    
    private String brCode;
    private String isbn;
    private String title;
    private String userId;
    private String dueDate;

}

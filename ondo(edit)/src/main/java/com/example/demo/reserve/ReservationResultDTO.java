package com.example.demo.reserve;

import lombok.Data;

@Data
public class ReservationResultDTO {
    private Integer rsNum;      // 예약자 수
    private Integer userSeq;    // 예약자 순번
}

package com.ssafy.fitmate.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.ssafy.fitmate.model.dao")
public class DBConfig {

}

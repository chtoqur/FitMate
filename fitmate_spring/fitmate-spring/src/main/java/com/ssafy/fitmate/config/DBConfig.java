package com.ssafy.fitmate.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.fitmate.community.model.dao")
public class DBConfig {

}

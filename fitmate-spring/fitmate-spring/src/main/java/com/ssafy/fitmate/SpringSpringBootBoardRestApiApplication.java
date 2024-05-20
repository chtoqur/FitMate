package com.ssafy.fitmate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.ssafy.fitmate")
public class SpringSpringBootBoardRestApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSpringBootBoardRestApiApplication.class, args);
		
	}

}

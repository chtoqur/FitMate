package com.ssafy.fitmate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.ssafy.fitmate")
public class FitMateRestApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(FitMateRestApiApplication.class, args);
		
	}

}

package com.ssafy.fitmate.util;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtUtil {
	String key = "SSAFY_NonMajor_JavaTrack_SecretKey";
	SecretKey skey = Keys.hmacShaKeyFor(key.getBytes(StandardCharsets.UTF_8));
	
	public String createToken(String id) {
		Date exp = new Date(System.currentTimeMillis() + 1000*60*60);
		return Jwts.builder().header().add("typ", "JWT").and().claim("id", id)
				.expiration(exp).signWith(skey).compact();
	}
	
	public Jws<Claims> validate(String token){
		return Jwts.parser().verifyWith(skey).build().parseSignedClaims(token);
	}
}

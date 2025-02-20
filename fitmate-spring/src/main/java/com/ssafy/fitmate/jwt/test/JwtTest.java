package com.ssafy.fitmate.jwt.test;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

public class JwtTest {
	public static void main(String[] args) {
		Map<String, String> headers = new HashMap<>();
		headers.put("typ", "JWT");
		
		String key = "SSAFY_NonMajor_JavaTrack_SecretKey";
		SecretKey skey = Keys.hmacShaKeyFor(key.getBytes(StandardCharsets.UTF_8));
		
		String token = Jwts.builder().header().add("name", "yang").add(headers).and()
		.subject("ssafy").expiration(new Date(System.currentTimeMillis() + 3000))
		.signWith(skey).compact();
		
		System.out.println(token);
		
		// Json WebToken Signature
		Jws<Claims> jwsClaims = Jwts.parser().verifyWith(skey).build().parseSignedClaims(token);
		
		System.out.println(jwsClaims.getHeader());
		System.out.println(jwsClaims.getPayload());
	}
}

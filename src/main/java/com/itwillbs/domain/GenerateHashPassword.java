package com.itwillbs.domain;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GenerateHashPassword {
	private MessageDigest md;
	
	public String getHashPassword_sha256(String sourceData) {
		try {
			// 1. MessageDigest 객체 생성(static 메서드 getInstance() 메서드 호출)
			md = MessageDigest.getInstance("sha-256"); // 파라미터로 해싱 알고리즘명 전달
			
			// 2. 원본 문자열 -> byte[] 타입으로 변환
			byte[] sourceBytes = sourceData.getBytes();
			
			// 3. MessageDigest 객체의 update() 메서드를 호출하여 배열로 변환된 원문 전달 
			md.update(sourceBytes);
			
			// 4. MessageDigest 객체의 digest() 메서드를 호출하여 원문에 대한 해싱 수행
			byte[] digestBytes = md.digest(); // 해싱 결과가 byte[] 타입으로 리턴됨
			
			// 5. String.format() 메서드를 사용하여 64비트 포맷 문자열 생성
			// => 파라미터 : 16진수 64자리 형식 지정문자열
			//				 BigInteger 객체 생성을 통해 byte[] 배열을 양의 정수로 변경
			String hashData = String.format("%064x", new BigInteger(1, digestBytes)).toUpperCase();
			
			return hashData;
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println("해싱 알고리즘 선택이 잘못되었습니다!");
		}
		
		return null;
	}

	public String getHashPassword_sha512(String sourceData) {
		try {
			// 1. MessageDigest 객체 생성(static 메서드 getInstance() 메서드 호출)
			md = MessageDigest.getInstance("sha-256"); // 파라미터로 해싱 알고리즘명 전달
			
			// 2. 원본 문자열 -> byte[] 타입으로 변환
			byte[] sourceBytes = sourceData.getBytes();
			
			// 3. MessageDigest 객체의 update() 메서드를 호출하여 배열로 변환된 원문 전달 
			md.update(sourceBytes);
			
			// 4. MessageDigest 객체의 digest() 메서드를 호출하여 원문에 대한 해싱 수행
			byte[] digestBytes = md.digest(); // 해싱 결과가 byte[] 타입으로 리턴됨
			
			// 5. String.format() 메서드를 사용하여 64비트 포맷 문자열 생성
			// => 파라미터 : 16진수 64자리 형식 지정문자열
			//				 BigInteger 객체 생성을 통해 byte[] 배열을 양의 정수로 변경
			String hashData = String.format("%06128x", new BigInteger(1, digestBytes)).toUpperCase();
			
			return hashData;
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println("해싱 알고리즘 선택이 잘못되었습니다!");
		}
		
		return null;
	}
}

package com.itwillbs.domain;

import java.util.Random;

public class resevationCode {

	public String makeCode() {
		makingCode mc = new makingCode(15);
		
		String code = mc.getCode();
		
		return code;
	}
	
}

class makingCode {
	private String code; // 예약코드 저장 변수
	
	private final char[] codeTable = {
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'0', '1', '2', '3', '4', '5', '6', '7', '8' , '9'
	};
	
//	public makingCode() {
//		coding(16);
//	}
	
	public makingCode(int codeLength) {
		coding(codeLength);
	}
	
	public void coding(int codeLength) {
		
		Random r = new Random();
		int tableLength = codeTable.length;
		
		StringBuffer buffer = new StringBuffer(codeLength);
		
		for(int i = 0; i< codeLength; i++ ) {
			
			buffer.append(codeTable[r.nextInt(tableLength)]);
		}
		
		code = buffer.toString();
		
	}
	
	public String getCode() {
		return code;
	}
}
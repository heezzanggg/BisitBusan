package com.green.user.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;

public interface WApiService {
	
	String search(String keyword, int numOfRows, int pageNo) 
			throws IOException;

	


}

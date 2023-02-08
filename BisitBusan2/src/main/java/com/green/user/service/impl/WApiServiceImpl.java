package com.green.user.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.green.user.service.WApiService;

@Service("wapiservice")
public class WApiServiceImpl implements WApiService {

	@Override
	public String search(String keyword, int numOfRows, int pageNo) throws IOException {

    	String key = "RaXfWQq2%2B%2FJuyXgVveJTnCUY6lGx%2FFcGuWUoe%2B%2FwuzRH5yyj8ZB1GdiVzHCrUEJB5EKjqpCr07GecLmhPDdZZA%3D%3D";	
    	
    	URL url = new URL("http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst?serviceKey="
				+ key + "&numOfRows=200&pageNo=1&dataType=JSON&regId=11H20201");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type","application/json");
		System.out.println("Resonse code:" + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) !=null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		System.out.println(sb.toString());
		return sb.toString();
		
	}

}

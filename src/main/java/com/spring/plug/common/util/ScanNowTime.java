package com.spring.plug.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ScanNowTime {
	public static String nowTime() {
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(time); //방 만든 시간 설정
		return now;
	}
}

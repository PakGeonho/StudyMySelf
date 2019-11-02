package kr.or.ddit.ibatis.factory;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {

	private static SqlMapClient client;
	
	static{
		Charset charSet = Charset.forName("UTF-8");
		Resources.setCharset(charSet);
		
		try {
			Reader reader = Resources.getResourceAsReader("kr/or/ddit/ibatis/config/SqlMapConfig.xml");//여기에 SqlMapConfig가 있는 경로를 넣어준다.
			client = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static SqlMapClient getSqlMapClient(){
		return client;
	}
}

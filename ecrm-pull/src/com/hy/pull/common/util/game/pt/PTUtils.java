package com.hy.pull.common.util.game.pt;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyStore;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;

import com.hy.pull.service.BaseService.Enum_flag;
import com.hy.pull.service.game.LogUtil;

/**
 * 拉取PT游戏数据工具类
 * 创建日期：2016-10-17
 * @author temdy
 */
public class PTUtils {
	
	/**
	 * 获取请求结果的方法
	 * @param url 接口链接
	 * @param fileurl 证书文件链接
	 * @param keyStore 密钥1
	 * @param x_ENTITY_KEY 密钥2
	 * @return 请求结果
	 * @throws Exception 异常对象
	 */
	public static String getResultByURL(String url,String fileurl,String keyStore,String x_ENTITY_KEY,String agent) throws Exception {
		try {
			URL pt = new URL(url);
			URLConnection yc = pt.openConnection();
			KeyStore ks = KeyStore.getInstance("PKCS12");
			File file = new File(fileurl);
			FileInputStream fis = new FileInputStream(file);
			ks.load(fis, keyStore.toCharArray());
			KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
			kmf.init(ks, keyStore.toCharArray());
			SSLContext sc = SSLContext.getInstance("TLS");
			sc.init(kmf.getKeyManagers(), null, null);
			yc.setRequestProperty("X_ENTITY_KEY",x_ENTITY_KEY);
			((HttpsURLConnection) yc).setSSLSocketFactory(sc.getSocketFactory());
			StringBuilder builder = getResponseText(yc.getInputStream(),new StringBuilder());
			return builder.toString();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			LogUtil.addListLog(LogUtil.HANDLE_PT, url, e.getMessage(), agent, Enum_flag.异常.value);
			return null;
		}
	}

	/**
	 * 获取响应结果
	 * @param netIps 流对象
	 * @param builder 字符串追加对象
	 * @return StringBuilder
	 * @throws Exception 异常对象
	 */
	private static StringBuilder getResponseText(InputStream netIps,StringBuilder builder) throws Exception {
		byte[] buffer = new byte[1024];
		int len;
		while ((len = netIps.read(buffer)) != -1) {
			builder.append(new String(buffer, 0, len, "UTF-8"));
		}
		return builder;
	}
}

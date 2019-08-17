///**
// * @author XuMenglin
// * @date 2019年8月17日
// *
// */
//package com.Controller;
//
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.util.AjaxJson;
//
///**
// * <p>Title: StuCodeController</p>
// * <p>Description: </p>
// * @author XuMenglin
// * @date 2019年8月17日
// */
//@Controller
//public class StuCodeController {
//	
//	/**
//	 * 自动生成编号格式：yyMM+四位流水号
//	 */
//	@RequestMapping(params = "createCode")
//	@ResponseBody
//	public AjaxJson createCode(HttpServletRequest request, String tableName,
//			String fieldName) {
//		AjaxJson j = new AjaxJson();
// 
//		String sql = "select Max(a." + fieldName + ") max_code from "
//				+ tableName + " a ";
// 
//		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//		list = jdbcTemplate.queryForList(sql);
//		// System.out.println("最大编号："+list.get(0).get("max_comment_code"));
//		String comment_code = ""; 
//		String max_code = "";
//		if (list.size() > 0) {
//			max_code = (String) list.get(0).get("max_code");
//		}
// 
//		SimpleDateFormat format = new SimpleDateFormat("yyMM"); // 时间字符串产生方式
//		String uid_pfix = format.format(new Date()); // 组合流水号前一部分，时间字符串，如：1601
//		System.out.println("time=" + format.format(new Date()));
//		if (max_code != null && max_code.contains(uid_pfix)) {
//			String uid_end = max_code.substring(4, 8); // 截取字符串最后四位，结果:0001
//			// System.out.println("uid_end=" + uid_end);
//			int endNum = Integer.parseInt(uid_end); // 把String类型的0001转化为int类型的1
//			// System.out.println("endNum=" + endNum);
//			int tmpNum = 10000 + endNum + 1; // 结果10002
//			// System.out.println("tmpNum=" + tmpNum);
//			UtilMethod um = new UtilMethod();
//			comment_code = uid_pfix + um.subStr("" + tmpNum, 1);// 把10002首位的1去掉，再拼成1601260002字符串
//		} else {
//			comment_code = uid_pfix + "0001";
//		}
//		// System.out.println(comment_code);
// 
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("msg", comment_code);
//		j.setAttributes(map);
//		return j;
//	}
// 
////公共方法
//public class UtilMethod {
//	
//	
//	 /*
//	  * 把10002首位的1去掉的实现方法：
//	  * @param str
//	  * @param start
//	  * @return
//	  */
//	 public String subStr(String str, int start) {
//	        if (str == null || str.equals("") || str.length() == 0)
//	            return "";
//	        if (start < str.length()) {
//	            return str.substring(start);
//	        } else {
//	            return "";
//	        }
// 
//	    }
//}
//
//}

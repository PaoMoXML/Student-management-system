/**
 * @author XuMenglin
 * @date 2019年8月17日
 *
 */
package com.Controller;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>Title: CheckCodeController</p>
 * <p>Description: 登录验证码</p>
 * @author XuMenglin
 * @date 2019年8月17日
 */
@RequestMapping(value = "/CheckCode")
@Controller()
public class CheckCodeController {
	 private Random random=new Random();
	 
	 @RequestMapping(value = "/CheckCode")
	 public void CheckCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 //内存图片对象(TYPE_INT_BGR 选择图片模式RGB模式)
	     BufferedImage image = new BufferedImage(90,30,BufferedImage.TYPE_INT_BGR);
	     //得到画笔
	     Graphics graphics = image.getGraphics();
	     //画之前要设置颜色，设置画笔颜色
	     graphics.setColor(Color.yellow);
	     //填充矩形区域（指定要画的区域设置区）
	     graphics.fillRect(0,0,90,30);
	     //为了防止黑客软件通过扫描软件识别验证码。要在验证码图片上加干扰线
	     //给两个点连一条线graphics.drawLine();
	     for (int i=0;i<5;i++){
    	 //颜色也要随机（设置每条线随机颜色）
    	 graphics.setColor(getRandomColor());
    	 int x1=random.nextInt(90);
    	 int y1=random.nextInt(30);
    	 int x2=random.nextInt(90);
    	 int y2=random.nextInt(30);
    	 graphics.drawLine(x1,y1,x2,y2);
    	 }
	     //拼接4个验证码，画到图片上
	     char [] arrays={'A','B','C','D','E'};
	     StringBuilder builder = new StringBuilder();
	     for(int i = 0; i < 4; i++) {
	    	 //设置字符的颜色
	    	 int index = random.nextInt(arrays.length);
	    	 builder.append(arrays[index]);
	     }
         //创建session对象将生成的验证码字符串以名字为checkCode保存在session中
	     request.getSession().setAttribute("checkCode", builder.toString());
	     //将4个字符画到图片上graphics.drawString(str ,x,y);一个字符一个字符画
	     for(int i=0;i<builder.toString().length();i++) {
	    	 graphics.setColor(getRandomColor());
	    	 char item = builder.toString().charAt(i);
	    	 graphics.drawString(item+"",10+(i*20),15);
	     }
	   //输出内存图片到输出流
	        ImageIO.write(image,"png",response.getOutputStream());
	     
	 }

	private Color getRandomColor() {
		 int r=random.nextInt(256);
         int g=random.nextInt(256);
         int b=random.nextInt(256);
        return new Color(r,g,b);
	}
	
}

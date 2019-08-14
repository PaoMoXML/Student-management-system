package com.test;


import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
 
@RunWith(value = SpringJUnit4ClassRunner.class) // 测试运行器
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" }) // 加载配置文件
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
 
public class Junit4Test{}
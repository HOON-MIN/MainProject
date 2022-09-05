package com.main.ateam.mybatis;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = {"com.main.ateam.admin.dao"})
public class MyBatisConfig {

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean ssf=new SqlSessionFactoryBean();
		PathMatchingResourcePatternResolver resolver= new PathMatchingResourcePatternResolver();
		ssf.setMapperLocations(resolver.getResources("classpath:mybatis/mpper/*.xml"));
		ssf.setTypeAliasesPackage("com.main.ateam.vo");
		return ssf.getObject();
	}
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		SqlSessionTemplate ss= new SqlSessionTemplate(sqlSessionFactory);
		return ss;
	}
	
}
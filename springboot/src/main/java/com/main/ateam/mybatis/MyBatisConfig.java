package com.main.ateam.mybatis;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = {"com.main.ateam.member.dao","com.main.ateam.pharmacy.dao",
		"com.main.ateam.hospital.dao","com.main.ateam.review.dao",
		"com.main.ateam.quesboard.dao","com.main.ateam.admin.dao",
		"com.main.ateam.drug.dao", "com.main.ateam.ansboard.dao",
		"com.main.ateam.doctor.dao","com.main.ateam.admin.dao",
		"com.main.ateam.company.dao","com.main.ateam.reserve.dao",
		"com.main.ateam.medInq.dao"})
public class MyBatisConfig {

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		
		SqlSessionFactoryBean ssf=new SqlSessionFactoryBean();
		
		ssf.setDataSource(dataSource);
		PathMatchingResourcePatternResolver resolver= new PathMatchingResourcePatternResolver();
		ssf.setMapperLocations(resolver.getResources("classpath:mybatis/mapper/*.xml"));
		ssf.setTypeAliasesPackage("com.main.ateam.vo");
		return ssf.getObject();
	}
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		SqlSessionTemplate ss= new SqlSessionTemplate(sqlSessionFactory);
		return ss;
	}
	
}

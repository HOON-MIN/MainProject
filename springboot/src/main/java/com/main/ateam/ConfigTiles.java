package com.main.ateam;

import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

public class ConfigTiles implements WebMvcConfigurer{
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer configurer=new TilesConfigurer();
		configurer.setDefinitions(new String[] {"WEB-INF/tiles/tiles-definitions.xml"});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver=new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		tilesViewResolver.setOrder(1);
		return tilesViewResolver;
	}
}

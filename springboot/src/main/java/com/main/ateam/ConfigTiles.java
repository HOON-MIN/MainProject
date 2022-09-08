package com.main.ateam;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class ConfigTiles {
	//View Setting
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"/WEB-INF/tiles/tiles-definitions.xml"});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	
	//뷰 세팅2
    @Bean
    public TilesViewResolver tilesViewResolver() {
        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
        tilesViewResolver.setOrder(1);  //뷰 우선순위
        return tilesViewResolver;
    }

}

package com.example.online_book_store.config;

import com.example.online_book_store.constants.Constant;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // Path to the external folder where images will be stored
    private static final String EXTERNAL_IMAGE_DIR = Constant.EXTERNAL_IMAGE_DIR;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Map /images/** to the external directory D:/Out Source Projects/online-book-store/data/images/
        registry.addResourceHandler("/images/**").addResourceLocations(EXTERNAL_IMAGE_DIR);
    }
}

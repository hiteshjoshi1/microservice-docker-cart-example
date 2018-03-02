package com.hitesh.microservices.inventory.swaggerconfig;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@Configuration
@EnableSwagger2
@EnableAutoConfiguration
public class SwaggerConfig {
    @Bean
    public Docket api() {

        return new Docket(DocumentationType.SWAGGER_2)
                        .select()
                        .apis(RequestHandlerSelectors.basePackage("com.hitesh.microservices.inventory"))
                        .paths(PathSelectors.any())
                        .build().apiInfo(new ApiInfo("Inventory Service Api Documentation",
                        		"Documentation generated via Swagger", 
                        		"1.0.0",null, new Contact("Hitesh Joshi", "https://www.linkedin.com/in/hitesh-joshi-a9928613/", "sendmailtojoshi@gmail.com"), null,null));
    }
}

package com.hitesh.microservices.zuulEdgeGateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
@EnableZuulProxy
@EnableDiscoveryClient
@EnableSwagger2
@SpringBootApplication
public class ZuulEdgeGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZuulEdgeGatewayApplication.class, args);
	}
}

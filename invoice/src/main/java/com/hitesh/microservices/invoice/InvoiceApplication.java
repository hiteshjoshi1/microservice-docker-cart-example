package com.hitesh.microservices.invoice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;


@SpringBootApplication(scanBasePackages={"com.hitesh.microservices.invoice"})
@EnableDiscoveryClient
public class InvoiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(InvoiceApplication.class, args);
	}
	
	   @LoadBalanced
	    @Bean
	    RestTemplate restTemplate() {
	        return new RestTemplate();
	    }

}

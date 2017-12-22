package com.hitesh.microservices.zipkinTimer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import zipkin.server.EnableZipkinServer;

@EnableZipkinServer
@SpringBootApplication
public class ZipkinTimerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZipkinTimerApplication.class, args);
	}
}

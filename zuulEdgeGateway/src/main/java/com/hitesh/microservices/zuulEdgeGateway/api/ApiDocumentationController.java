package com.hitesh.microservices.zuulEdgeGateway.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

/**
 * @author hitjoshi
 *
 */
@Component
@Primary
@EnableAutoConfiguration
public class ApiDocumentationController implements SwaggerResourcesProvider {

	    @Autowired
	    private SwaggerServicesConfig swaggerServiceList;

	    	    
	    public ApiDocumentationController() {

	    }

	    /**
	     * Swagger needs name, url and swagger version
	     * we populate an object SwaggerServices from the config of all microservices deployed 
	     */
		@Override
	    public List<SwaggerResource> get() {
	        List<SwaggerResource> resources = new ArrayList<>();

	        //Add the default swagger resource that correspond to the gateway's own swagger doc        
	        //resources.add(swaggerResource("Default", env.getRequiredProperty("url"), "2.0"));

	        // read the deployed microservices swagger configuration from the property file and display it here
	        // Ideally this config should be just pulled from config server
	        swaggerServiceList.getServices().forEach(service -> {
	        	resources.add(swaggerResource(service.getName(),service.getUrl(), service.getVersion()));
	        });
	        

	        return resources;
	    }

	    private SwaggerResource swaggerResource(String name, String location, String version) {
	        SwaggerResource swaggerResource = new SwaggerResource();
	        swaggerResource.setName(name);
	        swaggerResource.setLocation(location);
	        swaggerResource.setSwaggerVersion(version);
	        return swaggerResource;	
	    }	
	
// Hardcoding config , not a good idea
//	@Override
//	public List<SwaggerResource> get() {
//		List<SwaggerResource> resources = new ArrayList<>();
//		resources.add(swaggerResource("inventory-service", "/inventory-service/v2/api-docs", "2.0"));
//		resources.add(swaggerResource("customer-service", "/customer-service/v2/api-docs", "2.0"));
//		resources.add(swaggerResource("invoice-service", "/invoice-service/v2/api-docs", "2.0"));
//		return resources;
//	}
//
//	private SwaggerResource swaggerResource(String name, String location, String version) {
//		SwaggerResource swaggerResource = new SwaggerResource();
//		swaggerResource.setName(name);
//		swaggerResource.setLocation(location);
//		swaggerResource.setSwaggerVersion(version);
//		return swaggerResource;
//	}

}
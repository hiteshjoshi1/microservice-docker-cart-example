package com.hitesh.microservices.zuulEdgeGateway.api;

import java.util.List;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@EnableAutoConfiguration
@EnableConfigurationProperties
@ConfigurationProperties(prefix="documentation.swagger")
public class SwaggerServicesConfig {


    List<SwaggerServices> swagger;

    public List<SwaggerServices> getServices() {
        return swagger;
    }

    public void setServices(List<SwaggerServices> swaggerResources) {
        this.swagger = swaggerResources;
    }


    @EnableConfigurationProperties
    @ConfigurationProperties(prefix="documentation.swagger.services")
    public static class SwaggerServices{
        private String name;
        private String url;
        private String version;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getVersion() {
			return version;
		}

		public void setVersion(String version) {
			this.version = version;
		}

		@Override
		public String toString() {
			return "SwaggerServices [name=" + name + ", url=" + url + ", version=" + version + "]";
		}
     

    }   

}
package com.footballdash.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * Declares RestTemplate as a spring managed bean.
 * RestTemplate is used by the FootballApiService to make HTTP calls
 * to the football-data.org external api
 */

@Configuration
public class RestTemplateConfig {
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}

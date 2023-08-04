package ezen.team.shop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication  (exclude={SecurityAutoConfiguration.class}) 
@ComponentScan(basePackages={"ezen.team.interceptor","ezen.team.shop, ezen.team.controller", "ezen.team.service", "ezen.team.security","ezen.team.domain"})
@MapperScan(basePackages= {"ezen.team.mapper"})
public class MiniShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(MiniShopApplication.class, args);
	}

}

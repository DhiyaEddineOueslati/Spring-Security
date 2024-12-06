package tn.enig.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tn.enig.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled= true, securedEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	DataSource dataSource;
	
	@Autowired

	UserService userserv;
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	PasswordEncoder crt = passwordEncoder();
		auth.inMemoryAuthentication().withUser("admin").password(crt.encode("admin123")).roles("ADMIN");

	auth.inMemoryAuthentication().withUser("agent").password(crt.encode("agent123")).roles("AGENT");
	
	auth.inMemoryAuthentication().withUser("user").password(crt.encode("user123")).roles("USER");
		
		
		
//		auth.jdbcAuthentication().dataSource(dataSource)
//
//		.usersByUsernameQuery("select username as principal, password as credentials, active from user where username=?")
//
//		.authoritiesByUsernameQuery("select username as principal, role as role from user_roles where username=?")
//
//		.passwordEncoder(crt)
//
//		.rolePrefix("ROLE_");
		
		
		
		
		

//		auth.userDetailsService (userserv).passwordEncoder(crt);



		
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.formLogin().loginPage("/login").defaultSuccessUrl("/livres", true).failureUrl("/login?error=true").permitAll();

		http.authorizeRequests().antMatchers("/emprunts/ajout", "/livres/ajout", "/adherants/ajout").hasRole("ADMIN")
				.antMatchers("/adherants", "/emprunts/livre/**", "/emprunts/adherant/**").hasAnyRole("AGENT", "ADMIN");
		http.authorizeRequests().anyRequest().authenticated();

		
		http.logout()
        .logoutUrl("/logout")
        .logoutSuccessUrl("/login?logout") 
        .permitAll();
		http.csrf().disable();
		http.exceptionHandling().accessDeniedPage("/Page403");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}

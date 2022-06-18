package shop.getum.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity//직접 시큐리티 설정을 위해 사용
public class SecurityConfig extends WebSecurityConfigurerAdapter {//추가적인 시큐리트 기능을 쓰기 위해 상속받는다
    @Override
    public void configure(WebSecurity web) throws Exception {
        web
            .ignoring()
            .antMatchers("/h2-console/**", "/favicon.ico");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()//HttpServletRequest를 사용하는 요청들에 대한 접근제한을 설정하겠다는 의미
            .antMatchers("/api/hello").permitAll()//해당 url에 대한 요청은 인증없이 접근을 허용하겠다는 의미
            .mvcMatchers("/", "/login", "/member", "/check-email", "/check-email-token",
                "/email-login", "/check-email-login", "/login-link").permitAll()
            .anyRequest().authenticated();//나머지 요청은 인증 받아야 한다는 의미
    }
}

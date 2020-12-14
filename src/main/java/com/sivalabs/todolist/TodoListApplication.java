package com.sivalabs.todolist;

import com.sivalabs.todolist.config.ApplicationProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;

@Slf4j
@SpringBootApplication
@EnableConfigurationProperties({ ApplicationProperties.class})
@EnableScheduling
public class TodoListApplication implements CommandLineRunner {
    @Autowired
    private Environment env;

    public static void main(String[] args) {
        SpringApplication.run(TodoListApplication.class, args);
    }

    @Override
    public void run(String... args) {
        String application = env.getProperty("spring.application.name", "DefaultTodoListApplication");
        log.info("{} started successfully", application);
    }
}

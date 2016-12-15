package io.pivotal.pal.config;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringContextBridge implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        this.applicationContext = applicationContext;
        System.out.println("================");
    }

    public static RedisOperations redisService() {
        return (RedisOperations)applicationContext.getBean("redisOperations");
    }

}

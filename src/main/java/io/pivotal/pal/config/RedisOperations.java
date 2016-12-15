package io.pivotal.pal.config;


import org.springframework.data.redis.core.RedisTemplate;

import java.util.Set;

public class RedisOperations {

    private RedisTemplate<String,Object> redisTemplate;

    public Set<String> sessionKeys(){
        return redisTemplate.keys("*");
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}

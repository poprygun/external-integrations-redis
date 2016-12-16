
## Pivotal Acceleration Lab project demonstrating the use of external integration with spring-session Redis.

### Run simple java app
1. Checkout _v1.0_
>git checkout v1.0
2. Compile and run app
>mvn clean package && mvn tomcat7:run-war
3. Login with admin/password to http://localhost:9090

### Add spring-session and store session data in redis running locally
1. Checkout _v2.0_
2. Install docker-machine, docker-compose, docker
3. Start Redis serviece from project root directory run

>docker-compose up
4. Determine the IP address of the Redis container and make sure application.properties are pointing to the correct host

>eval "$(docker-machine env default)"

>docker-machine ip default
5. Login with admin/password to http://localhost:9090 and navigate to View Session Data link
6. Verify keys direclty in redis

>redis-cli -h 192.168.99.100 -p 6379
```bash
192.168.99.100:6379> keys '*'
1) "spring:session:expirations:1481899260000"
2) "spring:session:sessions:b2bc65d6-58c3-458d-809e-38b834dc3f7f"
3) "spring:session:sessions:expires:b2bc65d6-58c3-458d-809e-38b834dc3f7f"
```

### Provision Redis service in PCF and bind to the app
1. Checkout _v3.0_
2. Provision service

>cf create-service rediscloud 30mb redis-service

3. Make sure service is listed in manifest.yml, or alternatively bind it to the app after pushing it to Cloudfoundry

>bind-service external-integrations-redis redis-service

4. Login with admin/password to http://external-integrations-redis.cfapps.io/ and navigate to View Session Data link

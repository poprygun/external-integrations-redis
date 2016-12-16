
## Pivotal Acceleration Lab project demonstrating the use of external integration with spring-session Redis.

Add spring-session backed by redis.

### Prerequisites
1. Install docker, docker-compose, docker-machine
2. Start docker compose
    1. From project root directory.
     >docker-compose up
    2. Determine the IP address of your docker containger with command
     >docker-machine ip
    3. Verify that proper redis host, and port specified in application.properties

### Running the app
1. Start the app
>mvn tomcat7:run-war
2. Login to http://localhost:9090 with admin/password
3. Navigate to _Redis Session keys_ to see Session Keys stored in Redis
4. Alternatively login to redis-cli and list keys directly
>redis-cli -h 192.168.99.100 -p 6379
```bash
192.168.99.100:6379> keys '*'
1) "spring:session:expirations:1481899260000"
2) "spring:session:sessions:b2bc65d6-58c3-458d-809e-38b834dc3f7f"
3) "spring:session:sessions:expires:b2bc65d6-58c3-458d-809e-38b834dc3f7f"
```

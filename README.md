
## Pivotal Acceleration Lab project demonstrating the use of external integration with spring-session Redis.

Simple java web application

eval "$(docker-machine env default)"
docker-machine ip default



git tag -a v2.0 -m 'run locally with redis managed sessions'
redis-cli -h 192.168.99.100 -p 6379

cf create-service rediscloud 30mb redis-service
cf bind-service external-integrations-redis redis-service

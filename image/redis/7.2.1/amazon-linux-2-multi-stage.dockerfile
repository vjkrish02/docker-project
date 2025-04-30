# Use this source OCI image.
FROM sloopstash/base:v1.1.1 AS install_redis
 
# Switch to tmp directory.
WORKDIR /tmp
 
# Download and extract Redis.
RUN wget http://download.redis.io/releases/redis-7.2.1.tar.gz \
&& tar xvzf redis-7.2.1.tar.gz
 
# Switch to Redis source directory.
WORKDIR redis-7.2.1
 
# Compile and install Redis.
RUN make distclean \
&& make \
&& make install
 
FROM sloopstash/base:v1.1.1 AS copy_redis_binaries
 
COPY --from=install_redis /usr/local/bin/redis-server /usr/local/bin/redis-server
COPY --from=install_redis /usr/local/bin/redis-cli /usr/local/bin/redis-cli
sudo docker image build \

  -t sloopstash/redis-linear:v7.2.1 \ # Name of the resultant OCI image

  -f image/redis/7.2.1/amazon-linux-2.dockerfile \ # Dockerfile path.

  image/redis/7.2.1/context # Build context diectory.
 


 sudo docker image build -t sloopstash/redis:v7.2.1 -f image/redis/7.2.1/amazon-linux-2.dockerfile image/redis/7.2.1/context
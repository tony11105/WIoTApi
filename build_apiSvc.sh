docker pull python:3.8-alpine
docker build -t="wiot-api-svc:1.0.0" .
docker run -d -p 5000:5000 --name wiot-api-svc wiot-api-svc:1.0.0
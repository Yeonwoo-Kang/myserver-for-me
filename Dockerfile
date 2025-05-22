# 테스트 용으로 rockylinux9 이미지를 사용하여 Dockerfile을 작성
FROM rockylinux:9

EXPOSE 80

RUN dnf update -y
RUN dnf install -y nginx

CMD [ "nginx", "-g", "daemon off;" ]
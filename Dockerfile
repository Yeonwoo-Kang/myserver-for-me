FROM rockylinux:9

EXPOSE 80

SHELL [ "/bin/bash" , "-c" ]

# 빌드 시점에 환경변수로서 값 받음
ARG USERNAME
ARG PASSWORD

# 빌드 이후에도 사용가능하며 고정됨
ENV USERNAME=${USERNAME}
ENV PASSWORD=${PASSWORD}

RUN dnf update -y && \
    dnf install -y httpd httpd-tools && \
    # webdav 설치
    mkdir /var/www/html/webdav && \
    chown -R apache:apache /var/www/html/webdav
    
    # webdav 에 유저 추가/설정
RUN echo "${PASSWORD}" | htpasswd -ci /etc/httpd/webdav.password "${USERNAME}" && \
    chmod 640 /etc/httpd/webdav.password && \
    chown apache:apache /etc/httpd/webdav.password
    # httpd 조용히 시키기
    # echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

ADD webdav.conf /etc/httpd/conf.d/webdav.conf

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
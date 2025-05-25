FROM rockylinux:9

EXPOSE 80

SHELL [ "/bin/bash" , "-c" ]

ENV USERNAME="test"

# webdav 설치
RUN dnf update -y && \
    dnf install -y httpd && \
    mkdir /var/www/html/webdav && \
    chown -R apache:apache /var/www/html/webdav && \
    # webdav 에 유저 추가
    htpasswd -c /etc/httpd/webdav.password ${USERNAME} && \
    echo "test" && \
    echo "test" | htpasswd -i /etc/httpd/webdav.password yeonu && \
    chmod 640 /etc/httpd/webdav.password && \
    chown apache:apache /etc/httpd/webdav.password && \
    echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

ADD webdav.conf /etc/httpd/conf.d/webdav.conf

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
#!/bin/bash
set -e

# opvn 파일 생성을 위해 클라이언트 인증서 복사
cp /etc/openvpn/easy-rsa/pki/issued/client.crt /home/openvpn/
cp /etc/openvpn/easy-rsa/pki/private/client.key /home/openvpn/
cp /etc/openvpn/easy-rsa/pki/ca.crt /home/openvpn/

# 기타 필요한 명령 추가 가능

# 마지막에 openvpn 실행
exec openvpn /etc/openvpn/server.conf
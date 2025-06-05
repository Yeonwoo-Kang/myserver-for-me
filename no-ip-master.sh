#!/bin/bash
set -e

# 환경 변수 로드
source /usr/local/src/info.env
export NOIPADDRESS NOIPPASSWORD

# noip2 설정(필요시)
if [ ! -f /usr/local/etc/no-ip2.conf ]; then
  /usr/local/src/no-ip.sh
fi

# noip2 포그라운드 실행
/usr/local/bin/noip2

# 무한 대기 (컨테이너가 종료되지 않도록)
tail -f /dev/null
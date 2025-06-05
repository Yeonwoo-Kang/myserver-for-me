# myserver-for-me
집에서 사용하기 편하려고 만드는 서버

## 전제 조건
아래의 것들은 필수로 있어야 합니다

- Docker/Docker Desktop 설치
- Github 에 연결 가능한 인터넷
- Windows 를 사용중인 경우, WSL2 설치
- info.env 의 작성
- 과자 한 봉지

## info.env 
환경 변수를 저장하는 파일이며 직접 작성해야합니다.<br>

작성 위치: 리포지토리를 클론 한 디렉토리

### 작성 내용
USERNAME=[webdav에서 사용할 유저 이름]<br>
PASSWORD=[webdav 유저의 비밀번호]<br>

<br>

**예**
`USENAME=imuser<br>`
`PASSWORD=itspassword<br>`

---

## 진행 상황
### 설치됨

1. webdav
2. VPN(OpenVPN)

### 설치 예정

1. DDNS(NO-IP)
2. HTTPS 보안



## 클라이언트용 opvn 파일 작성
openvpn 서버 컨테이너가 실행되었을 때 openvpn 폴더가 생성되며 그 안에 인증서가 복사 됩니다.

### Windows의 경우
client.ovpn

```
client
dev tun
proto udp
remote [서버주소] 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-GCM
auth SHA256
verb 3

<ca>
(ca.crt 내용)
</ca>
<cert>
(client.crt 내용)
</cert>
<key>
(client.key 내용)
</key>
```

[서버주소] 는 localhost 또는 DDNS 주소 등 자신이 필요한 도메인을 삽입하면 됩니다.
포트는 기본 1194/udp를 사용하고 있습니다.
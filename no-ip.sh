#!/usr/bin/expect -f
set NOIPADDRESS $env(NOIPADDRESS)
set NOIPPASSWORD $env(NOIPPASSWORD)

cd /usr/local/src/noip-2.1.9-1
spawn make install
expect "Please enter the login/email string for no-ip.com"
send "$NOIPADDRESS\r"
expect "Please enter the password for user '$NOIPADDRESS'"
send "$NOIPPASSWORD\r"
expect "Please enter an update interval"
send "\r"
expect "Do you wish to run something at successful update?"
send "\r"
expect eof
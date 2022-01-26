
#!/usr/bin/env python3
import datetime
import socket
import time

hosts = {'drive.google.com':'0.0.0.0','mail.google.com':'0.0.0.0','google.com':'0.0.0.0'}
while 1==1:
    for host in hosts:
        ip = socket.gethostbyname(host)
        oldip = hosts[host]
        d = datetime.datetime.now()
        if oldip=='0.0.0.0':
            hosts[host] = ip
            print(d.strftime('%Y-%m-%d %H:%M:%S') + ' ' + host + ' - ' + ip)
        elif ip != oldip:
            print(d.strftime('%Y-%m-%d %H:%M:%S')+' [ERROR] '+host+' IP mismatch: '+oldip+' '+ip)
        else:
            print(d.strftime('%Y-%m-%d %H:%M:%S') + ' ' + host + ' - ' + ip)
    time.sleep(10)
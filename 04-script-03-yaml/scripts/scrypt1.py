#!/usr/bin/env python3
import datetime
import socket
import time
import json
import yaml
import os

cdlog = os.getcwd() + "/log/"
hosts = {'drive.google.com':'0.0.0.0','mail.google.com':'0.0.0.0','google.com':'0.0.0.0'}
while True:
    for host in hosts:
        error = False
        ip = socket.gethostbyname(host)
        oldip = hosts[host]
        d = datetime.datetime.now()
        if oldip == '0.0.0.0':
            hosts[host] = ip
        elif ip != oldip:
            error = True
        if error:
            print(d.strftime('%Y-%m-%d %H:%M:%S') + ' [ERROR] ' + host + ' IP mismatch: ' + oldip + ' ' + ip)
        else:
            print(d.strftime('%Y-%m-%d %H:%M:%S') + ' ' + host + ' - ' + ip)
        with open(cdlog + host + ".json", 'w') as jsf:
            json_data = json.dumps({host: ip})
            jsf.write(json_data)
        with open(cdlog + host + ".yaml", 'w') as ymf:
            yaml_data = yaml.dump([{host: ip}])
            ymf.write(yaml_data)
    time.sleep(10)
#!/usr/bin/env python
import time
import re
import socket
import sys
import os

server = "10.199.199.200"
port = 8888
auth_log = '/var/log/auth.log'

def follow(thefile):
    thefile.seek(0,2)
    while True:
        line = thefile.readline()
        if not line:
            time.sleep(0.1)
            continue
        yield line

def main():
    logfile = open(auth_log,"r")
    loglines = follow(logfile)
    print(loglines)
    for line in loglines:
        if re.match('.*sshd.*?(Failed|Connection\sclosed|Accepted).*',line) is not None:
            print(re.match)
            # report(server, port, '1')

if __name__ == '__main__':
    main()

#!/usr/bin/env python3
import os
import sys

cmd = os.getcwd()
if len(sys.argv)>=2:
    cmd = sys.argv[1]
bash_command = ["cd " + cmd, "ls -a | grep .git"]
result_git = os.popen(' && '.join(bash_command)).read()
if len(result_git)==0:
    print('This folder not fuond GIT')
    exit()
bash_command = ["cd "+cmd, "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
    elif result.find('new file') != -1:
        prepare_result = result.replace('\tnew file:   ', '')
        print(prepare_result)
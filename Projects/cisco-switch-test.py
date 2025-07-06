#!/usr/bin/python3
from netmiko import ConnectHandler
import getpass

#variables
host = '*.*.*.*'
port = '22'
device_type = 'cisco_ios'
username = '***'
password = getpass.getpass('Before we start, enter your password: ')

ssh = ConnectHandler(host=host, port=port, username=username, password=password, device_type=device_type)

command = input("Type the command you would like to run: ")
print("\n" + ssh.send_command(command))

ssh.disconnect
print("\n" + "Connection closed")

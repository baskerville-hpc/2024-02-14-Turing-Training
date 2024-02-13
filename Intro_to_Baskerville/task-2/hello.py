# hello.py

"""System module."""
import socket
import time

node = socket.gethostname()
ts1 = time.ctime()
print(f'Hello from {node} at {ts1}')
time.sleep(3)
ts2 = time.ctime()
print(f'Bye bye from {node} at {ts2}')

# Node-RED

## create user

```bash
adduser node-red
```


## create systemd service file to start Node-RED

```ini
# /usr/lib/systemd/system/node-red.service
[Unit]
Description=Node-RED graphical event wiring tool
Wants=network.target
Documentation=http://nodered.org/docs/hardware/raspberrypi.html

[Service]
Type=simple
User=pi
Group=pi
WorkingDirectory=/home/pi

Environment="NODE_OPTIONS=--max_old_space_size=512"
# uncomment and edit next line if you need an http proxy
#Environment="HTTP_PROXY=my.httpproxy.server.address"
# uncomment the next line for a more verbose log output
#Environment="NODE_RED_OPTIONS=-v"
# uncomment next line if you need to wait for time sync before starting
#ExecStartPre=/bin/bash -c '/bin/journalctl -b -u systemd-timesyncd | /bin/grep -q "systemd-timesyncd\[.*\]: Initial synchronization to time server"'

ExecStart=/usr/bin/env node-red-pi $NODE_OPTIONS $NODE_RED_OPTIONS
KillSignal=SIGINT
# Auto restart on crash
Restart=on-failure
RestartSec=20
# Tag things in the log
SyslogIdentifier=Node-RED
#StandardOutput=syslog

[Install]
WantedBy=multi-user.target
```

# cog
## Debug

### Debug on target

```bash
XDG_RUNTIME_DIR=/run/user/root gdbserver localhost:20000 cog -P fdo
```

### Debug on development-host

You have to install `gdb-multiarch`

```bash
gdb-multiarch target/usr/bin/cog
```

	then call in gdb

```
target remote 192.168.8.101:20000
```




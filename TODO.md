# NTP

https://feeding.cloud.geek.nz/posts/time-synchronization-with-ntp-and-systemd/

# Network

https://wiki.archlinux.org/index.php/Wpa_supplicant#At_boot_(systemd)


# MQTT

https://www.digitalocean.com/community/questions/how-to-setup-a-mosquitto-mqtt-server-and-receive-data-from-owntracks


```bash
mosquitto_passwd -c /etc/mosquitto/pwfile homebase
```

```bash
mkdir /var/lib/mosquitto/
chown zzeroo:zzeroo /var/lib/mosquitto/ -R
```

mosquitto_sub -h homeserver.zzeroo.lan -p 8883 -v -t 'homebase/#' -u zzeroo -P asrael

# systemd

[    7.002311] systemd-journald[143]: Creating journal file /var/log/journal/b3da3d6faacf4ad8beb5c917da8ee4ce/system.journal on a btrfs file system, and copy-on-write is enabled. This is likely to slow down journal access substantially, please consider turning off the copy-on-write file attribute on the journal directory, using chattr +C.
         Starting udev Kernel Device Manager...




```
XDG_RUNTIME_DIR=/run/user/root qt-webkit-kiosk -platform wayland -u http://google.de
XDG_RUNTIME_DIR=/run/user/root qt-webkit-kiosk -platform wayland -u http://homeserver.zzeroo.lan:1880/ui
```


```
setenv fdt_high ffffffff
setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait drm_kms_helper.drm_leak_fbdev_smem=1
fatload mmc 0 $kernel_addr_r zImage
fatload mmc 0 $fdt_addr_r sun7i-a20-bananapro.dtb
bootz $kernel_addr_r - $fdt_addr_r
```

```
mkimage -C none -A arm -T script -d boot.cmd boot.scr
```

```
scp /tmp/boot.scr root@homeserver-vanilla:/boot/
```


https://github.com/mripard/sunxi-mali/blob/master/README.md
http://linux-sunxi.org/U-Boot


```
lsmod

```


```
XDG_RUNTIME_DIR=/run/user/root cog -P fdo https://google.de
XDG_RUNTIME_DIR=/run/user/root G_MESSAGES_DEBUG=all MESA_DEBUG=1 EGL_LOG_LEVEL=debug LIBGL_DEBUG=verbose WAYLAND_DEBUG=1 cog -P fdo http://google.com

XDG_RUNTIME_DIR=/run/user/root weston --backend=fbdev-backend.so --tty=1 --device=/dev/fb0
XDG_RUNTIME_DIR=/run/user/root weston --backend=drm-backend.so --tty=1 --device=/dev/fb0
XDG_RUNTIME_DIR=/run/user/root weston --backend=drm-backend.so --tty=1 --drm-device=card0
```

# on target

```bash
XDG_RUNTIME_DIR=/run/user/root gdbserver localhost:20000 cog -P fdo https://google.de
```

# on development host

You have to install `gdb-multiarch`

```bash
gdb-multiarch target/usr/bin/cog
```

then call in gdb

```gdb
target remote 192.168.8.101:20000
```



```
XDG_RUNTIME_DIR=/run/user/root cog -P fdo
```


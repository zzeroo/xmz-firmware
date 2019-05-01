Buikldroot driven xmz firmware generation toolchain.

# Start custom build
First you have to check out the buildroot. Buildroot is an git submodule.
So first checkout the submodule and update to the version this repo holds.
```
git submodule init
git submodule update
```

Now you have to create the basic buildroot Makefiles. Call these commands:
```
cd buildroot
make O=../make BR2_EXTERNAL=../custom help
```

Finaly change into the `make` dir (You have to call **ALL** buildroot commands
from here!) and call a defconfig for the needed board. In this example we call
the configuration for the Lemaker BananaPro board.
```
cd ..
cd make
make xmz_bananapro_defconfig
make
```

# Directory structure of this project

buildroot       Source code of Buildroot. Only call update tasks from here.
                See the '#Update Buildroot' capter below.

custom          Custom buildroot configuration files.

make            "Out of the Buildroot tree" - Configuration
                https://buildroot.org/downloads/manual/manual.html#outside-br-custom

releases        Releases should placed here.

download        Download cache of buildroot.

cache           Compiler Cache (ccache) of buildroot.


# Adwanced usage
## Update Buildroot
```bash
cd ~/buildroot
git pull
# git branch -a
git checkout <LATEST_BRANCH>
make O=../make BR2_EXTERNAL=../custom help
```

## Burn SD card
```bash
# umount sdcard
sudo umount /dev/mmcblk0p{1,2}
# burn image
dd if=images/sdcard.img |pv|sudo dd bs=1M of=/dev/mmcblk0
```

## Build just kernel and uboot
First create a time stamp. Then clean linux and uboot build dirs. Then build
the `time` command prints the time stats after the build.
```bash
set TSTAMP build-(date +%F_%T_%N)
make linux-dirclean
make uboot-dirclean
time -p make | tee $TSTAMP.log
echo log file>>> $TSTAMP.log
```

To view the latest build.log
```bash
vim (ls -a build*.log|tail -n1)
```

## Customize the i3 config

Update the i3 config file.
```shell
$ mv ~/.config/i3/config ~/.config/i3/config.bk
$ cp ./i3/config ~/.config/i3/config
```

<br/>

## Install new fonts.

[Download new fonts](https://www.nerdfonts.com/font-downloads)
then unzip fonts to ```~/.fonts```. 
After that run reload font cache to detect new fonts.
```shell
$ sudo fc-cache -f -v
```

<br/>

## Install fcitx5-unikey.
### Download fcitx5-unikey using yay
```shell
$ yay -S fcitx5-unikey
$ yay -S kcm-fcitx5
```

Add fcitx config at the end of `~/.bashrc`. After that, logout and login for setting to take effect.
```shell
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
```

### Config input method in GUI.
```shell
$ fcitx5-configtool
```

In `input method` tab, add:
- Keyboard - Englist (US)
- Unikey

In `Global Options` tab, Change:
- `Trigger Input Method` __=>__ `Control+Left Shift`


<br/>


## Backround wallpapers.

- [Cityscape building](https://whvn.cc/yx76vg)

- [Bridge sun](https://whvn.cc/j59vq5)

- [Firewatch](https://whvn.cc/3z72w9)

- [Futuristic cityscape](https://whvn.cc/eyqe3k)

- [Houses](https://whvn.cc/7295o3)

- [Forest](https://whvn.cc/dgpy2m)

<br/>

### change desktop background wallpaper 
Find this line of code in ```~/.config/i3/config```.
```shell
# set wallpaper
exec_always --no-startup-id sleep 1 && feh --bg-fill <wallpaper_location>
```
Choose new wallpaper and insert into `<wallpaper_location>`.

<br/>

### change login background wallpaper
Open file slick-greeter.conf as root to modify. 
```shell
$ cd /etc/lightdm/
$ sudo nvim slick-greeter.conf
```

In this file change the background value to new wallpaper location.
```
[greeter]
background=<wallpaper_location>
```

<br/>

## Polybar

Install polybar.
```shell
$ yay -S polybar
```

Install font for polybar.
```shell
$ sudo pacman -S xorg-fonts-misc
$ yay -S siji-git ttf-unifont
```

Create config directory and copy config file to directory.
```shell
$ mkdir -p ~/.config/polybar
$ sudo cp ./polybar/ ~/.config/polybar/
$ sudo chmod +x ~/.config/polybar/launch.sh
```

note: check i3WM already had auto startup. If not then add at the end of `~/.config/i3/config`.
```
exec_always .config/polybar/launch.sh &
```

<br/>

## Keypassxc

### Install Keepassxc, rclone and cronie (for backup)
```shell
$ yay -S keepassxc rclone cronie
```

### Keepassxc config
Save all databases in ```~/.config/keepassxc/databases``` and backups databases in ```~/.config/keepassxc/backups```.

```shell
$ mkdir -p ~/.config/keepassxc/{databases,backups,scripts,logs} 
```

Open ```keepassxc```, locate __Setting__ => __General__ => __Backups desktination__, set value:
```
/home/$USER/.config/keepassxc/backups/{DB_FILENAME}-{TIME}.old.kdbx
```

### rclone config
```shell
$ rclone config
```
Add remote storages for backup databases:
- Near live
    + Onedrive

- Hourly
    + Box
    + Yandex disk
    + Dropbox
    + Google Drive

### Sync and backups config
```shell
$ cp ./keepassxc/* ~/.config/keepassxc/
$ chmod +x ~/.config/keepassxc/scripts/*.sh
```

### Crontab config
Enable/Disable cronie allow/disallow it to auto startup when reboot.
```shell
$ systemctl enable cronie.service
$ systemctl disable cronie.service
```

Start, check and stop cronie service
```shell
$ systemctl start cronie.service
$ systemctl status cronie.service
$ systemctl stop cronie.service
```


```shell
# Add cron jobs config
$ crontab ~/.config/keepassxc/scripts/cron.jobs
# List all cron jobs. (optional)
$ crontab -l
# Config cron job. (optional)
$ crontab -e
```

## Visual studio code
```shell
$ yay -S visual-studio-codo-bin
```
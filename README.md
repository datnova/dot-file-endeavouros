## i3 config location
~/.config/i3/config


## Backround images

- [Cityscape building](https://whvn.cc/yx76vg)

- [Bridge sun](https://whvn.cc/j59vq5)

- [Firewatch](https://whvn.cc/3z72w9)

- [Futuristic cityscape](https://whvn.cc/eyqe3k)

- [Houses](https://whvn.cc/7295o3)

- [Forest](https://whvn.cc/dgpy2m)

<br/>

### change background wallpaper
Find this line of code.
```shell
# set wallpaper
exec_always --no-startup-id sleep 1 && feh --bg-fill <wallpaper_location>
```
Choose new background image in <wallpaper_location>.

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

## Customize the status bar in the i3 WM

```shell
$ mkdir .config/i3status
$ sudo cp /etc/i3status.conf ~/.config/i3status/i3status.conf
$ sudo chown $USER:$USER ~/.config/i3status/i3status.conf
```

change config file to providing the path to the new status config file.

```shell
bar {
    status_command i3status -c /home/$USER/.config/i3status/i3status.conf
    
    ...
}
```

## Polybar

Install polybar.
```shell
$ yay -S polybar
```

Install font for polybar example.
```shell
$ sudo pacman -S xorg-fonts-misc
$ yay -S siji-git ttf-unifont
```

Create config directory and copy config  file to directory.
```shell
$ mkdir ~/.config/polybar
$ sudo cp /etc/polybar/config.ini ~/.config/polybar
$ sudo chown $USER:$USER ~/.config/polybar/config 
```

Default launch script.
```shell
#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
```


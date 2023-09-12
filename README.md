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

## Customize the status bar in the i3WM

Remove the i3 bar in config file.
```
$ cd .config/i3/
$ nvim config
```

In the config file, find the bar and comment out everything.
```
# bar {
#     ...
# }
```

<br/>

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

Create config directory and copy config file to directory.
```shell
$ mkdir ~/.config/polybar
$ sudo cp /etc/polybar/config.ini ~/.config/polybar
$ sudo chown $USER:$USER ~/.config/polybar/config.ini
```

Change name example bar into bar by editing the file ~/.config/polybar/config.ini
```
# [bar/example]
[bar/bar]
...
```

Create `launch.sh` in ~/.config/polybar/
Paste default launch script and add execution permission.
```shell
#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar bar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
```

After that at this line at the end of the i3 config file.
```
exec_always ~/.config/polybar/launch.sh &
```

<br/>

Add more font by download font in nerdfont. After that, unzip into ~/.fonts
Change font in config file, ~/.config/i3/config and ~/.config/polybar/config.ini

In ~/.config/polybar/config.ini
```
font-0: <font name>:size=10;2
```

In ~/.config/i3/config
```
font pango: <font name> 10
```

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

## Install ibus-bamboo.

Download ibus-bamboo using yay.
```shell
$ yay -S ibus-bamboo
```

Add ibus config at the end of `~/.bashrc`. After that, logout and login back for setting to take effect.
```shell
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
```

Change ibus-bamboo swap key and add vietnamese.
```shell
$ ibus-setup
```

- Change `Next input method` from `<Super>space` to `<Control>space` (if not it wont work)  
- Navigate to `Input method` tab and add `Vietnamese - Bamboo`  

Finally, logout and login back and use ctrl + space to change between VN and US keyboard.

<br/>

## Backround wallpapers.

- [Cityscape building](https://whvn.cc/yx76vg)

- [Bridge sun](https://whvn.cc/j59vq5)

- [Firewatch](https://whvn.cc/3z72w9)

- [Futuristic cityscape](https://whvn.cc/eyqe3k)

- [Houses](https://whvn.cc/7295o3)

- [Forest](https://whvn.cc/dgpy2m)

<br/>

### change background wallpaper in i3 config file
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

Install font for polybar example.
```shell
$ sudo pacman -S xorg-fonts-misc
$ yay -S siji-git ttf-unifont
```

Create config directory and copy config file to directory.
```shell
$ mkdir ~/.config/polybar
$ sudo cp ./polybar/ ~/.config/polybar/
$ sudo chmod +x ~/.config/polybar/launch.sh
```

note: check i3WM already had auto startup. If not then add at the end of `~/.config/i3/config`.
```
exec_always .config/polybar/launch.sh &
```
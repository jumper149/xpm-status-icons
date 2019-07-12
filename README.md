# xpm-status-icons
This is a set of Icons for any status bar.

![showcase-12-07-19](https://raw.githubusercontent.com/jumper149/data/master/xpm-status-icons/showcase.png)

Feel free to use them in any way you want and fork to make your own versions.
If you want to contribute your own icons, you can make a pull request.

## Executables
There are a few executables in `bin/`:
- `changeColors.sh`:  change colors of a XPM
- `createShowcase.sh`: create an image of all icons in `xpm-status-icons/icons/`
- `changeAllColors.sh`: change colors of every XPM in `xpm-status-icons/icons/`

## XPM as an icon-format
XPM is suited well for minimalistic, pixel based icons.

Pros:
- image is basically source code
- image can be edited from your text editor (vim is suited very well)
- colors can changed with simple commands like `sed -i '21,36s/g/b/g' example.xpm`

Cons:
- not every bar supports XPM
- XPM is bitmap, not a vector graphic, diagonal lines will look jagged
- huge filesizes compared to PNG

## my Setup
I am using my own fork of [xmobar](https://github.com/jumper149/xmobar/tree/newCoreTemp) (branch newCoreTemp).
Workspaces are piped into xmobar from xmonad.
You can find the configuration files for [xmobar](https://github.com/jumper149/dotfiles/blob/master/.xmobar/xmobarrc) and [xmonad](https://github.com/jumper149/dotfiles/blob/master/.xmonad/xmonad.hs) in my [dotfiles](https://github.com/jumper149/dotfiles).

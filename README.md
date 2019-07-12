# xpm-status-icons
This is a set of Icons for any status bar.

Feel free to use them in any way you want and or fork to make your own versions.
If you want to contribute your own icons, you can make a pull request.

## XPM as an icon-format
XPM is suited well for minimalistic, pixel based icons.

Pros:
- image is basically source code
- image can be edited from your text editor (vim is suited very well)
- colors can changed with simple commands like `sed '21,36s/g/b/g' example.xpm`

Cons:
- not every bar supports XPM
- XPM is bitmap, not a vector graphic
- diagonal lines will look jagged

## my Setup
I am using my own fork of [xmobar](https://github.com/jumper149/xmobar/tree/newCoreTemp) (branch newCoreTemp).
Workspaces are piped into xmobar from xmonad.

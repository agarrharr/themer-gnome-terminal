# themer-gnome-terminal [![Travis](https://img.shields.io/travis/agarrharr/themer-gnome-terminal.svg)](https://travis-ci.org/agarrharr/themer-gnome-terminal)

A Terminal.app theme generator for [themer](https://github.com/mjswensen/themer).

## Dependencies

This module utilizes [Swift](https://swift.org/) and the [AppKit](https://developer.apple.com/reference/appkit) library to create the contents of the theme file. Install Xcode and you should be good to go.

## Installation & usage

Install this module wherever you have `themer` installed.

    npm install themer-gnome-terminal

Then pass `themer-gnome-terminal` as a `-t` (`--template`) argument to `themer`:

    themer -c my-colors.js -t themer-gnome-terminal -o gen/

`themer-gnome-terminal` will generate a `gnome-terminal-dark-install.sh` or `gnome-terminal-light-install.shl` (or both), depending on which color set you passed to `themer`.

To install your theme, run the following. Replace `Default` with the name of your profile. To find out the name of your profile, or to create a new one, go to Preferences -> Profiles.

```sh
chmod 755 gnome-terminal-dark-install.sh
./gnome-terminal-dark-install.sh Default
```

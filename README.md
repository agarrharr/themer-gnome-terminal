# themer-gnome-terminal [![Travis](https://img.shields.io/travis/agarrharr/themer-gnome-terminal.svg)](https://travis-ci.org/agarrharr/themer-gnome-terminal)

A Terminal.app theme generator for [themer](https://github.com/mjswensen/themer).

## Dependencies

This module utilizes [Swift](https://swift.org/) and the [AppKit](https://developer.apple.com/reference/appkit) library to create the contents of the theme file. Install Xcode and you should be good to go.

## Installation & usage

Install this module wherever you have `themer` installed.

    npm install themer-gnome-terminal

Then pass `themer-gnome-terminal` as a `-t` (`--template`) argument to `themer`:

    themer -c my-colors.js -t themer-gnome-terminal -o gen/

`themer-gnome-terminal` will generate a `themer-dark.terminal` or `themer-light.terminal` (or both), depending on which color set you passed to `themer`.

To install your theme, run `./install.sh Default`, to change the colors in the Default profile.

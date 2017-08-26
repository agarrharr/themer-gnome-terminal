#!/bin/bash

gnome_color () {
  AA=${1:1:2}
  BB=${1:3:2}
  CC=${1:5:2}

  echo "#${AA}${AA}${BB}${BB}${CC}${CC}"
}

rgb_color() {
  hexinput=`echo $1 | tr '[:lower:]' '[:upper:]'`  # uppercase-ing
  a=`echo $hexinput | cut -c-2`
  b=`echo $hexinput | cut -c3-4`
  c=`echo $hexinput | cut -c5-6`

  r=`echo "ibase=16; $a" | bc`
  g=`echo "ibase=16; $b" | bc`
  b=`echo "ibase=16; $c" | bc`

  echo 'rgb(${r}, ${g}, ${b})'
}

$ACCENT0=CommandLine.arguments[1]
$ACCENT1=CommandLine.arguments[2]
$ACCENT2=CommandLine.arguments[3]
$ACCENT3=CommandLine.arguments[4]
$ACCENT4=CommandLine.arguments[5]
$ACCENT5=CommandLine.arguments[6]
$ACCENT6=CommandLine.arguments[7]
$ACCENT7=CommandLine.arguments[8]

$SHADE0=CommandLine.arguments[9]
$SHADE1=CommandLine.arguments[10]
$SHADE2=CommandLine.arguments[11]
$SHADE3=CommandLine.arguments[12]
$SHADE4=CommandLine.arguments[13]
$SHADE5=CommandLine.arguments[14]
$SHADE6=CommandLine.arguments[15]
$SHADE7=CommandLine.arguments[16]

COLOR_01='$(rbg_color $SHADE0)'              # HOST
COLOR_02='$(rbg_color $ACCENT0)'           # SYNTAX_STRING
COLOR_03='$(rbg_color $ACCENT3)'           # COMMAND
COLOR_04='$(rbg_color $ACCENT2)'           # COMMAND_COLOR2
COLOR_05='$(rbg_color $ACCENT5)'           # PATH
COLOR_06='$(rbg_color $ACCENT7)'           # SYNTAX_VAR
COLOR_07='$(rbg_color $ACCENT4)'           # PROMPT
COLOR_08='$(rbg_color $SHADE6)'           #

COLOR_09='$(rbg_color $SHADE1)'           #
COLOR_10='$(rbg_color $ACCENT1)'           # COMMAND_ERROR
COLOR_11='$(rbg_color $ACCENT4)'           # EXEC
COLOR_12='$(rbg_color $ACCENT2)'           #
COLOR_13='$(rbg_color $ACCENT5)'           # FOLDER
COLOR_14='$(rbg_color $ACCENT7)'           #
COLOR_15='$(rbg_color $ACCENT4)'           #
COLOR_16='$(rbg_color $SHADE7)'           #

BACKGROUND_COLOR=$(gnome_color '${SHADE0}')
FOREGROUND_COLOR=$(gnome_color '${SHADE6}')   # Text
CURSOR_COLOR=$(gnome_color '${ACCENT6}') # Cursor

gnomeVersion="$(expr "$(gnome-terminal --version)" : '.* \(.*[.].*[.].*\)$')"
dircolors_checked=false

profiles_path=/org/gnome/terminal/legacy/profiles:

set_theme() {
  profile=$(get_uuid $1)
  profile_path=$profiles_path/$profile

  dconf write $profile_path/palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"

  # set foreground, background and highlight color
  # dconf write $profile_path/bold-color "'$SOME_COLOR'"
  dconf write $profile_path/background-color "'$BACKGROUND_COLOR'"
  dconf write $profile_path/foreground-color "'$FOREGROUND_COLOR'"

  # make sure the profile is set to not use theme colors
  dconf write $profile_path/use-theme-colors "false"

  # set highlighted color to be different from foreground color
  dconf write $profile_path/bold-color-same-as-fg "true"
}


get_uuid() {
  profiles=($(dconf list $profiles_path/ | grep ^: | sed 's/\///g'))
  # Print the UUID linked to the profile name sent in parameter
  local profile_name=$1
  for i in ${!profiles[*]}
    do
      if [[ "$(dconf read $profiles_path/${profiles[i]}/visible-name)" == \
          "'$profile_name'" ]]
        then echo "${profiles[i]}"
        return 0
      fi
    done
  echo "$profile_name"
}

set_theme $1

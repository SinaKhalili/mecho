#!/bin/zsh

mecho() {
  colors=(black red green yellow blue purple cyan white)
  effects=(reset bold dim italic underline blink rblink reverse)
  M=$1
  M=${M//\[\/\]/\[reset\]}
  i=0
  for color in $colors; do
    M=${M//\[$color\]/\\033[0;3$((i))m}
    M=${M//\[bg_$color\]/\\033[4$((i))m}
    i=$((i+1))
  done
  i=0
  for effect in $effects; do
    M=${M//\[$effect\]/\\033[$((i))m}
    i=$((i+1))
  done
  printf "$M\n"
}

mecho "$1"
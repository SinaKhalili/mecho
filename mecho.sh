#!/bin/bash

mecho() {
  colors=(black red green yellow blue purple cyan white)
  effects=(reset bold dim italic underline blink rblink reverse)
  if [ "$1" == "-n" ]; then nl=0; shift; else nl=1; fi
  M="$*"; M=${M//\[\/\]/\[reset\]}
  for i in "${!colors[@]}"; do
    M=${M//\[${colors[$i]}\]/\\033[0;3${i}m}
    M=${M//\[bg_${colors[$i]}\]/\\033[4${i}m}
    M=${M//\[${effects[$i]}\]/\\033[${i}m}
  done
  printf -- "$M"
  if [ "$nl" -eq 1 ]; then printf "\n"; fi
}

mecho "$@"
#!/bin/zsh

mecho() {
  colors=(black red green yellow blue purple cyan white)
  effects=(reset bold dim italic underline blink rblink reverse)
  indexes=(0 1 2 3 4 5 6 7)
  if [ "$1" = "-n" ]; then nl=0; shift; else nl=1; fi
  M="$*"; M=${M//\[\/\]/\[reset\]}
  for n in $indexes; do
    M=${M//\[${colors[$((n+1))]}\]/\\033[0;3${n}m}
    M=${M//\[bg_${colors[$((n+1))]}\]/\\033[4${n}m}
    M=${M//\[${effects[$((n+1))]}\]/\\033[${n}m}
  done
  printf -- "$M"
  if [ "$nl" -eq 1 ]; then printf "\n"; fi
}

mecho "$@"
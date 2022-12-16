#!/bin/fish

function mecho
  set -l colors black red green yellow blue purple cyan white
  set -l effects reset bold dim italic underline blink rblink reverse
  set M $argv[1]
  set M (echo "$M" | sed 's/\[\/\]/\\033[0m/g')
  set i 1
  for color in $colors
    set M (echo "$M" | sed "s/\[$color\]/\\033[0;3$i/m")
    set M (echo "$M" | sed "s/\[bg_$color\]/\\033[4$i/m")
    set i (math $i + 1)
  end
  set i 1
  for effect in $effects
    set M (echo "$M" | sed "s/\[$effect\]/\\033[$i/m")
    set i (math $i + 1)
  end
  printf "$M\n"
end

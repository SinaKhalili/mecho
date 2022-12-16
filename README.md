# mecho

mecho is _marked up_ echo. It's a shell function for printing colored and 
formatted text to the terminal using a simple markup.

```bash
mecho "A [red]rose[/] is a [bg_red]rose[/] is a [red][bold][bg_yellow]rose[/]"
```
![screenshot](https://raw.githubusercontent.com/SinaKhalili/mecho/main/screenshot.png)

## Installation

Just copy the `mecho` function into your shell's rc file.
Here it is, in full, for `bash`:

```bash
mecho() {
  colors=(black red green yellow blue purple cyan white)
  effects=(reset bold dim italic underline blink rblink reverse)
  M=$1; M=${M//\[\/\]/\[reset\]}
  for i in "${!colors[@]}"; do
    M=${M//\[${colors[$i]}\]/\\033[0;3${i}m}
    M=${M//\[bg_${colors[$i]}\]/\\033[4${i}m}
    M=${M//\[${effects[$i]}\]/\\033[${i}m}
  done
  printf "$M\n"
}
```

Also in this repo is the `zsh` version.

## Tags

`mecho` takes a single argument, which is the string to print, with
markup tags. The tags are in the form `[tag]` and `[/]` to reset.

Colors: `black`, `red`, `green`, `yellow`, `blue`, `purple`, `cyan`, `white`

Effects: `reset`, `bold`, `dim`, `italic`, `underline`, `blink`, `rblink`, `reverse`

To make a background color, prefix the color with `bg_`.

To stack tags, just put them in order, like [color][effect][bg_color]

Markup inspired by [rich](https://github.com/willmcgugan/rich), in turn inspired by
BBCode.
# mecho

mecho is _marked up_ echo. It's a shell function for printing colored and 
formatted text to the terminal using a simple markup.

```bash
mecho "A [red]rose[/] is a [bg_red]rose[/] is a [red][bold][bg_yellow]rose[/]"
```
![screenshot](https://raw.githubusercontent.com/SinaKhalili/mecho/main/screenshot.png)

Or alternatively
```bash
# use it like 'echo' with no quotes
mecho boredom [bg_green]unto[/] freedom
# suppress newline at the end with the -n flag
mecho -n "[yellow][bold](User: zer0Cool)[/]"
```

## Installation

Just copy the `mecho` function into your shell's rc file.
Here it is, in full, for `bash`:

```bash
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
```

Also in this repo is the `zsh` version.

## Usage

Much like, `echo`, `mecho` takes any number of arguments and prints them to 
standard output, interpreting a simple markup syntax of `[tags]` to colors and effects, with an optional newline at the end. 
The tags are in the form `[tag]` and `[/]` to reset.

Colors: `black`, `red`, `green`, `yellow`, `blue`, `purple`, `cyan`, `white`

Effects: `reset`, `bold`, `dim`, `italic`, `underline`, `blink`, `rblink`, `reverse`

To make a background color, prefix the color with `bg_`.

To suppress the newline at the end, use the `-n` flag.

To stack tags, just put them in order, like [color][effect][bg_color]

Markup inspired by [rich](https://github.com/willmcgugan/rich), in turn inspired by BBCode.
# pet.fish

Nicer fish shell support for [knqyf263/pet](https://github.com/knqyf263/pet), the snippet manager.

This project takes inspiration and code from
[aluxian/fish-pet](https://github.com/aluxian/fish-pet) and
[PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish) to make for a
fully-featured, somewhat opinionated [pet](https://github.com/knqyf263/pet)
integration.

## Features

This plugin defines two new keybindings:

- `Ctrl-s` will open a search within your pet snippets, including a preview
  window that nicely formats the snippet's code and metadata.
- `Ctrl-Alt-n` will create a new pet snippet, either from the current
  command-line (if it's not empty) or by opening a search window for your
  command history.

pet.fish uses the same styling as
[fzf.fish](https://github.com/PatrickF1/fzf.fish) (without requiring it as a
dependency), so if you also use fzf.fish, the interface should adapt to your
fzf.fish configuration.

## Installation

This plugin only depends on [fzf](https://github.com/junegunn/fzf) and assumes
that `fzf` is set as pet's `"selectcmd"` in its configuration file (usually
`~/.config/pet/config.toml`).

Install via [fisher](https://github.com/jorgebucaran/fisher):

```
fisher install mbollmann/pet.fish
```


## TODO

- Describe features better in README

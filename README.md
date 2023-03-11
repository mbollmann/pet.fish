# pet.fish

Nicer fish shell support for [knqyf263/pet](https://github.com/knqyf263/pet), the snippet manager.

This project takes inspiration and code from
[aluxian/fish-pet](https://github.com/aluxian/fish-pet) and
[PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish) to make for a
fully-featured, somewhat opinionated [pet](https://github.com/knqyf263/pet)
integration.

## Installation

This plugin only depends on [fzf](https://github.com/junegunn/fzf) and assumes
that `fzf` is set as pet's `"selectcmd"` in its configuration file.

Install via [fisher](https://github.com/jorgebucaran/fisher):

```
fisher add mbollmann/pet.fish
```

If you also have [fzf.fish](https://github.com/PatrickF1/fzf.fish) installed,
the function to save a new snippet *(see below)* will re-use your custom
`$fzf_history_opts` configuration, making for a more unified user interface.


## TODO

- Add keybindings
- Describe features in README

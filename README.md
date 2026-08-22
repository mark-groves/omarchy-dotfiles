# Omarchy Dotfiles

Personal overrides for an [Omarchy](https://omarchy.org/) machine.

Omarchy already ships Git, Herdr, Starship, Bash, Ghostty, and Neovim. Most of that is fine. This repo tracks only the files that differ from those defaults, then links them into `$HOME`.

A new Git repo should start on `main`, not Omarchy's `master`. Herdr keeps Omarchy's keymap and only overrides pane chrome. The prompt should keep its two-line layout and still follow `omarchy theme set`. Bash should put a blank line between the command you type and its output.

Everything else stays with Omarchy. Do not fork `~/.config/git/config`, Ghostty, or Neovim here. If you change only one key, store only that key.

Each override is a file under its app directory. Live paths are symlinks into this repo, except Starship. Starship's palette is generated. The file you edit is the template. `omarchy theme set` writes the colors into `~/.local/state/omarchy/current/theme/starship.toml`.

`omarchy refresh` copies stock files back over some of these paths and drops the symlink. Skip `omarchy refresh herdr` and `omarchy refresh config starship.toml` unless you want the defaults back.

## Apply the overlays

Run these commands from the repo root. `ln -sfn` replaces an existing link.

### Git

Omarchy sets `init.defaultBranch` to `master` in `~/.config/git/config`. Git reads `~/.gitconfig` after that file, so this one-key override wins.

```bash
ln -sfn "$PWD/git/.gitconfig" ~/.gitconfig
```



### Herdr

Omarchy's keymap, with boxed panes instead of tmux-style splitters.

```bash
ln -sfn "$PWD/herdr/.config/herdr/config.toml" ~/.config/herdr/config.toml
omarchy restart herdr
```



### Bash

`PS0` prints one blank line between the command you typed and its output.

```bash
ln -sfn "$PWD/bash/rc.local" ~/.config/omarchy/user-rc
```

If `~/.bashrc` does not already load that file, add this line in the user section at the bottom:

```bash
[[ -r ${XDG_CONFIG_HOME:-$HOME/.config}/omarchy/user-rc ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/omarchy/user-rc"
```

Then `source ~/.bashrc` or open a new shell.

### Starship

The prompt layout lives in `starship.toml.tpl`. Theme tokens such as `{{ accent }}` become the current palette when you run `omarchy theme set`.

1. Link the template:
  `bash kdir -p ~/.config/omarchy/themed n -sfn "$PWD/starship/.config/omarchy/themed/starship.toml.tpl" ~/.config/omarchy/themed/starship.toml.tpl` 
2. Generate the palette. This re-applies the theme you already use:
  `bash marchy theme set "$(omarchy theme current)"` 
3. Point Starship at the generated file:
  `bash n -sfn ~/.local/state/omarchy/current/theme/starship.toml ~/.config/starship.toml` 

A later `omarchy theme set` rewrites the generated file. The `~/.config/starship.toml` link stays.
# Dotfiles

Minimal dotfiles configuration for macOS (M1+, zsh).

## Setup

1. **Clone the repository**
   Clone to `~/dotfiles`. If you prefer a different location (e.g., `~/git/dotfiles`), clone there and create a symlink: `ln -s ~/git/dotfiles ~/dotfiles`.
   ```bash
   git clone https://github.com/rossstockman/dotfiles.git ~/dotfiles
   ```

2. **Configure Zsh**
   Add the following to your `~/.zshrc`:
   ```zsh
   # --- dotfiles root ---
   DOTFILES="$HOME/dotfiles"
   # --- zsh config ---
   [[ -f "$DOTFILES/zsh/aliases.zsh" ]] && source "$DOTFILES/zsh/aliases.zsh"
   [[ -f "$DOTFILES/zsh/prompt.zsh" ]] && source "$DOTFILES/zsh/prompt.zsh"
   ```

3. **Configure Git**
   Add the following to your `~/.gitconfig`:
   ```gitconfig
   [include]
       path = ~/dotfiles/git/gitconfig
   ```

4. **Personal Secrets**
   Create `~/dotfiles/.secrets/gitconfig` (this file is git-ignored):
   ```gitconfig
   [user]
       name = Your Name
       email = your.email@example.com
   ```

## Contents
- `zsh/`: Custom prompt and aliases.
- `git/`: Shared git configuration and global ignore rules.
- `.secrets/`: Local machine-specific overrides.

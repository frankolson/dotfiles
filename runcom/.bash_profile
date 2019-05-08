DOTFILES_DIR="$HOME/.dotfiles"

for DOTFILE in "$DOTFILES_DIR"/system/.{path,env,env_local,alias,prompt}; do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

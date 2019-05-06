DOTFILES_DIR="$HOME/.dotfiles"

for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,path}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

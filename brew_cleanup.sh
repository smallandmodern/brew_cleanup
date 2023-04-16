#!/bin/zsh

# This script fetches the list of installed Homebrew programs,
# lets the user choose which ones to uninstall, and then uninstalls
# the selected programs. It also runs brew autoremove to clean up
# any leftover dependencies.

if ! command -v gum >/dev/null 2>&1; then
  printf "gum is not installed. Install it? (yes/no): "
  read answer
  case "$answer" in
    [Yy]* ) brew install gum ;;
    * ) printf "gum is required. Exiting.\n"; exit 1 ;;
  esac
fi

fetch_program_info() {
  brew leaves | xargs brew info 2>/dev/null | \
  awk -v RS='\n\n' -v FS='\n' -v OFS=' - ' \
  '/^==> /{gsub("^==> ", "", $1); sub(":.*$", "", $1); print $1, $2}'
}

program_info=$(gum spin --spinner dot \
  --title "Fetching installed programs and descriptions..." \
  --show-output -- zsh -c "$(declare -f fetch_program_info); fetch_program_info")

printf "Choose software to uninstall:\n"
selected_programs=$(printf "%s" "$program_info" | \
  gum choose --no-limit | awk -F' - ' '{print $1}')

if [ -z "$selected_programs" ]; then
  printf "No software selected. Exiting.\n"
  exit 0
else
  brew uninstall ${(z)selected_programs}
  brew autoremove
fi

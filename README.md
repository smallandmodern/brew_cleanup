# Homebrew Cleanup Assistant 🧹

A handy Zsh script to simplify uninstalling Homebrew-installed programs you no longer need, and tidy up your system with `brew autoremove`.

## Description

This useful script fetches the list of installed Homebrew programs, along with their descriptions (because it's easy to forget why you installed some of them). It lets you conveniently select which programs to remove from your system, and then proceeds with the uninstallation. After that, it wraps up the cleaning process with `brew autoremove`, ensuring that your system stays neat, organized, and clutter-free.

## Requirements

- [Homebrew](https://brew.sh)
- [gum](https://github.com/defunkt/gum) (installed automatically if not present)

## Usage

1. Clone this repository or download the `brew_cleanup.sh` script.
2. Make the script executable with `chmod +x brew_cleanup.sh`.
3. Run the script with `./brew_cleanup.sh`.

You'll be greeted with a list of installed Homebrew programs, complete with their descriptions to jog your memory. Choose the ones you'd like to uninstall, and confirm your selection. The script will take care of uninstalling the selected programs and finish up with a `brew autoremove` to sweep away any leftover dependencies, leaving your system spick and span.

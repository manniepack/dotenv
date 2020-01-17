if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Add Homebrew `sbin`
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Kitty terminal completion
# kitty + complete setup fish | source

# RubyVersionManager initialization
# rvm default

# Fish plugin `done` min pop-up duration
set -Ux __done_min_cmd_duration 15000

# Add source code highlighting to LESS
# (update through `brew`)
# set hilite (which src-hilite-lesspipe.sh)
# set -x LESSOPEN "| $hilite %s"
# set -x LESS " -XRumJNiF"

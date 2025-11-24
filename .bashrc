#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- 1. XDG Base Directory Standards (Put these first) ---
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# --- 2. Application Specific Redirects ---
# Move Cargo (Rust) to .local/share/cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Move Go to .local/share/go
export GOPATH="$XDG_DATA_HOME/go"

# Move Nvidia shader cache to .cache/nv
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"

# Move Bun to .local/share/bun (Cleaning up ~/.bun)
export BUN_INSTALL="$XDG_DATA_HOME/bun"

# --- 3. PATH Configuration ---
# Add binary paths for the tools moved above
export PATH="$CARGO_HOME/bin:$GOPATH/bin:$BUN_INSTALL/bin:$PATH"

# --- 4. Aliases & Settings ---
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Note: Starship usually overrides PS1, but keeping this as fallback is fine
PS1='[\u@\h \W]\$ '

# --- 5. Functions ---
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# --- 6. Tool Initialization ---
# fnm
eval "$(fnm env --use-on-cd --shell bash)"

# starship
eval "$(starship init bash)"

# fastfetch
sleep 0.1
fastfetch

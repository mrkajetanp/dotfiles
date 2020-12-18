set -gx PATH "$HOME/.bin" $PATH;
set -gx PATH "$HOME/.emacs.d/bin" $PATH;
set -gx PATH "/usr/local/sbin" $PATH;
set -gx PATH "/opt/metasploit-framework/bin" $PATH;
set -gx PATH "/opt/android-sdk/emulator" $PATH;
set -gx PATH "/opt/android-sdk/platform-tools" $PATH;
set -gx PATH "/usr/local/lib/ruby/gems/2.7.0/bin" $PATH;
set -gx PATH "/home/kajetan/.gem/ruby/2.7.0/bin" $PATH;
set -gx PATH "$HOME/.pub-cache/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;
set -gx PATH "$GOPATH/bin" $PATH;
set -gx PATH "$CARGO_HOME/bin" $PATH;

set -gx EDITOR "/usr/bin/nvim";
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

export TERMINAL=alacritty
export MONITOR_SECOND=eDP-1
export MONITOR_THIRD=DP-1

export XDG_CONFIG_HOME=/home/kajetan/.config
export XDG_DATA_HOME=/home/kajetan/.local/share
export STARSHIP_CONFIG=/home/kajetan/.config/starship/config.toml
export MPLAYER_HOME=/home/kajetan/.config/mplayer
export KDE_HOME=/home/kajetan/.config/kde
export NPM_CONFIG_USERCONFIG=/home/kajetan/.config/npm/npmrc
export GEM_SPEC_CACHE=/home/kajetan/.cache/gem
export GOPATH=/home/kajetan/.local/share/go
export RUSTUP_HOME=/home/kajetan/.local/share/rustup
export CARGO_HOME=/home/kajetan/.local/share/cargo
export TERMINFO=/home/kajetan/.local/share/terminfo
export TERMINFO_DIRS=/home/kajetan/.local/share/terminfo:/usr/share/terminfo
export NODE_REPL_HISTORY=/home/kajetan/.local/share/node_repl_history
export NVM_DIR=/home/kajetan/.local/share/nvm
export GEM_HOME=/home/kajetan/.local/share/gem
export _Z_DATA=/home/kajetan/.local/share/z/data
export CCACHE_DIR=/home/kajetan/.local/share/ccache

export LESSHISTFILE=-
export XDG_CURRENT_DESKTOP=KDE
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export HISTFILE="$XDG_DATA_HOME"/bash/history

export SPACEVIMDIR=$XDG_CONFIG_HOME/spacevim/
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

alias mkdir="mkdir -p"

alias cat="/usr/bin/bat"
alias ocat="/usr/bin/cat"

alias svim="sudo vim"
alias fvim="/usr/local/bin/nvim (fzf)"
alias hvim="/usr/local/bin/nvim (find . | fzf)"
alias wget="wget --hsts-file=/home/kajetan/.cache/wget-hsts"
alias rundf="/home/kajetan/Games/DwarfFortress/LinuxLNP/startlnp"
alias lsblk="lsblk -o NAME,FSTYPE,SIZE,FSUSED,LABEL,MOUNTPOINT"
alias lsblk="lsblk && echo '' && findmnt -nt btrfs"
alias lsblku="lsblk -o NAME,FSTYPE,SIZE,UUID,MOUNTPOINT"
alias nvpn="nordvpn"

alias pn="printf \"%d\""
alias gitacp="git add . && git commit && git push"
alias cache-clean="rm -rf /home/kajetan/.cache/*"

alias encr="gpg --encrypt -r kajetan.puchalski@tuta.io --armor"
alias decr="gpg --decrypt"

alias nf="neofetch"

alias tp="trash-put"
alias tl="trash-list"
alias trestore="trash-restore"
alias te="trash-empty"
alias trm="trash-rm"

alias pcp="ppcp"
alias cp="cpg -rg"
alias mv="mvg -g"

alias ls="/usr/bin/exa"
alias exa="exa -al"
alias np="n -P p"
alias N="sudo -E nnn -dH"

alias tickers-stock='watch -n 120 -tc ticker.sh "^SPX" "^IXIC" "^DJI" "^FTSE" "^GDAXI" "^FCHI" "^N225" "^HSI" "GC=F" "SI=F" "CL=F" "AAPL" "MSFT" "TSLA" "AMZN" "NFLX" "FB" "IBM" "INTC" "AMD" "NVDA" "SPOT" "MA" "V" "SQ" "JPM" "BAC" "GS" "MS" "BYND"'
alias tickers-currencies='watch -n 120 -t -c ticker.sh EURUSD=X GBPUSD=X JPY=X CHF=X CAD=X CNY=X INR=X USDHKD=X USDSGD=X USDMXN=X GBPEUR=X GBPJPY=X GBPCAD=X GBPAUD=X GBPCHF=X GBPNOK=X EURCHF=X EURCAD=X EURJPY=X EURSEK=X EURHUF=X BTC-USD ETH-USD XRP-USD LTC-USD BCH-USD XMR-USD ZEC-USD'

alias reboot="loginctl reboot"
alias poweroff="loginctl poweroff"
alias suspend="loginctl suspend"
alias hibernate="loginctl hibernate"

alias snapper="snapper -c artixroot"
alias snapperh="snapper -c home"

alias rc-service="sudo rc-service"

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

status --is-interactive; and source (rbenv init -|psub)

export LC_COLLATE="C"
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PIPE='/tmp/nnn_pipe'
export NNN_PLUG='b:bookmarks;p:preview-tui;v:imgview;n:nmount;i:pskill;d:dragdrop;e:suedit;h:hexview;c:chksum;t:treeview;l:launch;m:mediainf;k:kdeconnect;o:fzopen;s:pass;f:fzcd;z:fzz;w:bitwarden'
export OPENCV_LOG_LEVEL=ERROR
export BOOKMARKS_DIR=$XDG_DATA_HOME/nnn/bookmarks

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

starship init fish | source

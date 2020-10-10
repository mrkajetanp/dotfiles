set -gx PATH "$HOME/.bin" $PATH;
set -gx PATH "$HOME/.emacs.d/bin" $PATH;
set -gx PATH "$HOME/go/bin" $PATH;
set -gx PATH "/usr/local/lib/ruby/gems/2.7.0/bin" $PATH;
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "/usr/local/sbin" $PATH;
set -gx PATH "/opt/metasploit-framework/bin" $PATH;
set -gx PATH "/opt/android-sdk/emulator" $PATH;
set -gx PATH "/opt/android-sdk/platform-tools" $PATH;
set -gx PATH "/home/kajetan/.gem/ruby/2.7.0/bin" $PATH;
set -gx PATH "$HOME/.pub-cache/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;

set -gx EDITOR "/usr/local/bin/nvim";
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

alias mkdir="mkdir -p"
alias exa="exa -al"

alias cat="/usr/bin/bat"
alias ocat="/usr/bin/cat"

alias ls="n -d"
alias lso="/bin/ls"
alias vim="/usr/local/bin/nvim"

alias fvim="/usr/local/bin/nvim (fzf)"
alias hvim="/usr/local/bin/nvim (find . | fzf)"

alias rundf="/home/kajetan/Games/DwarfFortress/LinuxLNP/startlnp"
alias lsblk="lsblk -o NAME,FSTYPE,SIZE,FSUSED,LABEL,MOUNTPOINT"
alias lsblku="lsblk -o NAME,FSTYPE,SIZE,UUID,MOUNTPOINT"

alias pn="printf \"%d\""
alias gitacp="git add . && git commit && git push"
alias cache-clean="rm -rf /home/kajetan/.cache/*"

alias nf="neofetch"

alias tp="trash-put"
alias tl="trash-list"
alias trestore="trash-restore"
alias te="trash-empty"
alias trm="trash-rm"

alias cp="cpg -rg"
alias mv="mvg -g"

alias np="n -P p"
alias N="sudo -E nnn -dH"

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

status --is-interactive; and source (rbenv init -|psub)

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

export TERMINAL=st
export LC_COLLATE="C"
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PIPE='/tmp/nnn_pipe'
export NNN_PLUG='b:bookmarks;p:preview-tui;v:imgview;n:nmount;i:pskill;d:dragdrop;e:suedit;h:hexview;c:chksum;t:treeview;l:launch;m:mediainf;k:kdeconnect;o:fzopen;s:pass;f:fzcd;z:fzz;w:bitwarden'

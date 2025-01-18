if status is-interactive
    # set -gx GPG_TTY (tty)
end

abbr l eza -al
abbr ls eza
abbr cat bat -p
abbr md mkdir

abbr g git
abbr gb git branch
abbr gch git checkout
abbr gsh git show
abbr gl git pull
abbr gp git push
abbr gpf! git push --force
abbr ga git add
abbr gst git status
abbr gc git commit
abbr gc! git commit --amend
abbr grb git rebase
abbr grbc git rebase --continue
abbr grba git rebase --abort
abbr grv git remote -v

abbr nf neofetch
abbr ff fastfetch
abbr vim nvim

abbr fishconfig chezmoi edit ~/.config/fish/config.fish && chezmoi apply
abbr vimconfig chezmoi edit ~/.config/nvim/init.lua && chezmoi apply

abbr pkg doas pkg

abbr cm chezmoi
abbr hl hledger
abbr hlui hledger-ui -t -E

abbr leiup podman run -v /Users:/Users --env HOME=$HOME -t -i public-inbox lei up --all
abbr leishell podman run -v /Users:/Users --env HOME=$HOME -t -i public-inbox /bin/bash

abbr nm neomutt

abbr em emacs -nw
abbr ec emacsclient -nw
abbr ect emacsclient -c -t -s temp

abbr zigup zigup --install-dir ~/.zigup

abbr vmfedora ssh -p 2222 kajetan@localhost
abbr za zellij attach

set LIBRARY_PATH "/usr/lib:/usr/local/lib:/opt/homebrew/opt/zstd/lib:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"

source ~/.config/fish/local.fish

function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end

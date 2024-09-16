if status is-interactive
    set -gx GPG_TTY (tty)
end

abbr l eza -al
abbr ls eza
abbr cat bat
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
abbr vim hx

abbr fishconfig chezmoi edit ~/.config/fish/config.fish && chezmoi apply
abbr vimconfig chezmoi edit ~/.config/nvim/init.lua && chezmoi apply

abbr cm chezmoi
abbr hl hledger
abbr hlui hledger-ui -t -E

abbr leiup podman run -v /Users:/Users --env HOME=$HOME -t -i public-inbox lei up --all
abbr leishell podman run -v /Users:/Users --env HOME=$HOME -t -i public-inbox /bin/bash

abbr nm neomutt

set -Ux EDITOR hx
set -g EDITOR hx

source ~/.config/fish/local.fish

function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end

transmission-daemon &

# Vertical Monitor - Unus
bspc rule -a Opera:Opera -o node=@^1:^1:/1
bspc rule -a st-256color:visualiser -o node=@^1:^1:/2/1
bspc rule -a st-256color:tickers -o node=@^1:^1:/2/2

# Main Screen - Term
bspc rule -a st-256color:main -o node=@^2:^1:/1/1
bspc rule -a st-256color:files -o node=@^2:^1:/1/2
bspc rule -a st-256color:secondary -o node=@^2:^1:/2/1
bspc rule -a st-256color:torrents -o node=@^2:^1:/2/2

bspc rule -a Opera:Opera -o node=@^2:^2:/

bspc rule -a Emacs:emacs -o node=@^2:^4:/

bspc rule -a Anki:anki -o node=@^2:^5:/

bspc rule -a Zathura:org.pwmt.zathura -o node=@^2:^6:/

# Media Workspace
bspc rule -a Spotify:spotify -o node=@^2:^7:/1/1
bspc rule -a st-256color:volume -o node=@^2:^7:/1/2
bspc rule -a st-256color:radio -o node=@^2:^7:/2/1
bspc rule -a st-256color:music -o node=@^2:^7:/2/2

# Org
bspc rule -a Emacs:emacs -o node=@^2:^8:/

# Others
bspc rule -a Signal:signal -o node=@^2:^9:/1
bspc rule -a tutanota-desktop:tutanota-desktop -o node=@^2:^9:/2

# Games
bspc rule -a Bitwarden:bitwarden -o node=@^2:^10:/

# Launch programs

st -n "main" -e fish -C "" &
st -n "secondary" -e fish -C "neofetch" &
st -n "files" -e fish -C "ranger" &
st -n "torrents" -e fish -C "tremc" &

firefox &
emacs &

anki &
bspc rule -a Anki:anki -o node=@^2:^5:/

zathura &
/home/kajetan/.bin/spotify-launch &

bspc rule -a Emacs:emacs -o node=@^2:^8:/
emacs &

st -n "volume" -e fish -C "pulsemixer" &
st -n "music" -e fish -C "cmus" &
st -n "radio" -e fish -C "curseradio" &

signal-desktop &
tutanota-desktop &

bitwarden &

# st -n "visualiser" -e fish -C "vis" &
# st -n "tickers" -e fish -C "main-tickers" &


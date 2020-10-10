transmission-daemon &

bspc rule -a st-256color:main -o node=@^1:^1:/1/1
bspc rule -a st-256color:files -o node=@^1:^1:/1/2
bspc rule -a st-256color:secondary -o node=@^1:^1:/2/1
bspc rule -a st-256color:torrents -o node=@^1:^1:/2/2

bspc rule -a firefox:Navigator -o node=@^1:^2:/
bspc rule -a Emacs:emacs -o node=@^1:^4:/

bspc rule -a Anki:anki -o node=@^1:^5:/

bspc rule -a Zathura:org.pwmt.zathura -o node=@^1:^6:/

bspc rule -a Spotify:spotify -o node=@^1:^7:/1/1
bspc rule -a st-256color:volume -o node=@^1:^7:/1/2
bspc rule -a st-256color:other -o node=@^1:^7:/2/1
bspc rule -a st-256color:music -o node=@^1:^7:/2/2

bspc rule -a Signal:signal -o node=@^1:^9:/1
bspc rule -a tutanota-desktop:tutanota-desktop -o node=@^1:^9:/2

st -n "main" -e fish -C "" &
st -n "secondary" -e fish -C "neofetch" &
st -n "files" -e fish -C "ranger" &
st -n "torrents" -e fish -C "tremc" &

firefox &
emacs &

anki &
bspc rule -a Anki:anki -o node=@^1:^5:/

zathura &
/home/kajetan/.bin/spotify-launch &

bspc rule -a Emacs:emacs -o node=@^1:^8:/
emacs &

st -n "volume" -e fish -C "pulsemixer" &
st -n "music" -e fish -C "cmus" &
st -n "other" -e fish -C "neofetch" &
signal-desktop &
tutanota-desktop &


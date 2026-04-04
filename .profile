# Source modular profile configuration
for _f in ~/.profile.d/*.sh; do
    [ -f "$_f" ] && . "$_f"
done
unset _f

# Source a local profile if it exists
if [ -f ~/.profile.local ]; then
    . ~/.profile.local
fi

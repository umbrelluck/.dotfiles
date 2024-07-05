#! /bin/sh

# alacritty  & 
#
# BLUETUITH_ID=$!
#
# sleep 0.105
# hyprctl dispatch setfloating pid:"$BLUETUITH_ID"
# sleep 0.105
# hyprctl dispatch focuswindow pid:"$BLUETUITH_ID" 
# sleep 0.105
# hypcrtl dispatch resizewindowpixel exact 20% 10% pid:"$BLUETUITH_ID"
# sleep 0.105
# # hyprctl dispatch centerwindow
#
#

alacritty -e " sleep 0.105 && hyprctl dispatch setfloating active && sleep 0.105 && hypcrtl dispatch resizeactive exact 20% 10% && sleep 0.105 && hyprctl dispatch centerwindow"

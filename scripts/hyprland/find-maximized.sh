#! /usr/bin/zsh

: "${XDG_RUNTIME_DIR:?Environment variable XDG_RUNTIME_DIR not set}"
: "${HYPRLAND_INSTANCE_SIGNATURE:?Environment variable HYPRLAND_INSTANCE_SIGNATURE not set}"

handle() {
  case "$1" in 
    fullscreen* | movewindow* |workspace*)
      check_active_fullscreeen
    ;;
  esac
}

check_active_fullscreeen() {
  has_fullscreen=$(hyprctl activeworkspace -j | jq -r .hasfullscreen)
  windows=$(hyprctl activeworkspace -j | jq -r .windows)
  visual=$($has_fullscreen && echo "" || echo "")   #
  # printf '{"text": "%s", "class": "%s"}' "$visual" "$has_fullscreen"
  echo "$visual"
  # state=$($has_fullscreen )
}

# Initial update
check_active_fullscreeen

# Listen to events and handle them
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

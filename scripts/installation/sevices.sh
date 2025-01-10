#! /usr/bin/zsh

# TODO: later add clamav databasse

echo "-----< SERVICES >-----"

services=("cronie.service" "NetworkManager.service" "reflector.timer" \
    "nvidia-hibernate.service" "nvidia-persistenced.service" "nvidia-resume.service" "nvidia-suspend.service")

for service in $services; do
    echo "Enabling $service unit file..."
    is_present = $(systemctl list-unit-files $service -quiet)
    if [[ -n $is_present && $(echo $is_present | awk '{ print $2 }') == "disabled" ]]; then
        doas systemctl enable --now $service
    fi
done

services=("hyprpolkitagent.service")

echo "Done"
echo "-------------------------"

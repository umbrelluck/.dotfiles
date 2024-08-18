#!/usr/bin/zsh

nmcli con mod "Wired connection 1" \
  ipv4.addresses "HOST_IP_ADDRESS/IP_NETMASK_BIT_COUNT" \
  ipv4.gateway "IP_GATEWAY" \ 
  ipv4.dns "PRIMARY_IP_DNS,SECONDARY_IP_DNS" \
  ipv4.dns-search "DOMAIN_NAME" \
  ipv4.method "manual"


nmcli con mod "Wired connection 1" \
  ipv4.addresses "" \
  ipv4.gateway "" \
  ipv4.dns "" \
  ipv4.dns-search "" \
  ipv4.method "auto"

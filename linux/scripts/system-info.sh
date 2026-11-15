#!/usr/bin/env bash
set -Eeuo pipefail

printf '=== System Information ===\n'
printf 'Hostname: %s\n' "$(hostname)"
printf 'Kernel:   %s\n' "$(uname -r)"
printf 'OS:       %s\n' "$(. /etc/os-release 2>/dev/null; printf '%s' "${PRETTY_NAME:-Unknown}")"
printf 'Uptime:   %s\n' "$(uptime -p 2>/dev/null || uptime)"
printf '\n=== CPU ===\n'
if command -v nproc >/dev/null 2>&1; then printf 'Logical CPUs: %s\n' "$(nproc)"; fi
printf '\n=== Memory ===\n'
if command -v free >/dev/null 2>&1; then free -h; else echo 'free command not available'; fi
printf '\n=== Filesystems ===\n'
df -h -x tmpfs -x devtmpfs

#!/usr/bin/env bash
set -Eeuo pipefail

THRESHOLD="${1:-80}"
if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] || (( THRESHOLD < 1 || THRESHOLD > 100 )); then
  echo 'Usage: disk-monitor.sh [threshold-percent: 1-100]' >&2
  exit 2
fi

printf 'Filesystem usage (warning threshold: %s%%)\n' "$THRESHOLD"
warning=0
while IFS= read -r line; do
  read -r filesystem size used available percent mountpoint <<< "$line"
  usage="${percent%%%}"
  printf '%-28s %4s used at %s\n' "$mountpoint" "$percent" "$filesystem"
  if (( usage >= THRESHOLD )); then
    printf 'WARNING: %s is at or above %s%%\n' "$mountpoint" "$THRESHOLD" >&2
    warning=1
  fi
done < <(df -P -x tmpfs -x devtmpfs | tail -n +2)
exit "$warning"

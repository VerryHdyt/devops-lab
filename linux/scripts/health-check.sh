#!/usr/bin/env bash
# Basic Linux host health check for the DevOps Lab.
set -Eeuo pipefail

DISK_WARN="${DISK_WARN:-80}"
MEMORY_WARN="${MEMORY_WARN:-90}"
failed=0

print_status() {
  local label="$1" value="$2" threshold="$3"
  if (( value >= threshold )); then
    printf '[WARN] %-12s %s%% (threshold: %s%%)\n' "$label" "$value" "$threshold"
    failed=1
  else
    printf '[ OK ] %-12s %s%%\n' "$label" "$value"
  fi
}

if ! [[ "$DISK_WARN" =~ ^[0-9]+$ && "$MEMORY_WARN" =~ ^[0-9]+$ ]]; then
  echo "DISK_WARN and MEMORY_WARN must be integers." >&2
  exit 2
fi

disk_used=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')
if [[ -z "$disk_used" ]]; then
  echo "Unable to read root filesystem usage." >&2
  exit 2
fi

if [[ -r /proc/meminfo ]]; then
  memory_used=$(awk '
    /^MemTotal:/ { total=$2 }
    /^MemAvailable:/ { available=$2 }
    END {
      if (total > 0) printf "%d", ((total-available) / total) * 100
      else exit 1
    }' /proc/meminfo) || {
      echo "Unable to calculate memory usage." >&2
      exit 2
    }
else
  echo "Memory metrics require Linux /proc/meminfo." >&2
  exit 2
fi

echo "Linux host health check"
echo "Hostname: $(hostname)"
echo "Uptime:   $(uptime -p 2>/dev/null || uptime)"
echo
print_status "Disk (/)" "$disk_used" "$DISK_WARN"
print_status "Memory" "$memory_used" "$MEMORY_WARN"

if (( failed )); then
  echo
  echo "Health check completed with warnings."
  exit 1
fi

echo
echo "Health check passed."

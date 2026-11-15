#!/usr/bin/env bash
set -Eeuo pipefail

if (( $# != 2 )); then
  echo 'Usage: backup.sh <source-directory> <backup-directory>' >&2
  exit 2
fi

source_dir="${1%/}"
backup_dir="${2%/}"
if [[ ! -d "$source_dir" ]]; then
  echo "Source directory does not exist: $source_dir" >&2
  exit 1
fi
if [[ -z "$backup_dir" || "$backup_dir" == "$source_dir" ]]; then
  echo 'Choose a separate, non-empty backup destination.' >&2
  exit 1
fi
mkdir -p -- "$backup_dir"
timestamp="$(date +%Y%m%d-%H%M%S)"
archive="$backup_dir/$(basename "$source_dir")-$timestamp.tar.gz"
tar -czf "$archive" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"
printf 'Backup created: %s\n' "$archive"

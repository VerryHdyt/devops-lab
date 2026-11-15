# Linux Fundamentals

This module builds practical Ubuntu administration skills.

## Topics
- Navigate the filesystem and inspect files.
- Understand users, groups, permissions, and processes.
- Inspect CPU, memory, storage, and network information.
- Read system logs and manage services with `systemctl`.
- Automate repeatable tasks with Bash.

## Labs
1. Run `scripts/system-info.sh` to collect a read-only system summary.
2. Run `scripts/disk-monitor.sh` to inspect filesystem usage.
3. Review `scripts/backup.sh` and test it on a disposable directory.

All scripts are designed to run without root privileges. The backup script writes only to a destination you specify.
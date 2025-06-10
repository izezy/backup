#!/bin/bash
created=$(cat ~/.config/fastfetch/fs_created)
created_sec=$(date -d "$created" +%s)
now_sec=$(date +%s)
diff_sec=$((now_sec - created_sec))

years=$((diff_sec / 31536000))
months=$(( (diff_sec % 31536000) / 2592000 ))
days=$(( (diff_sec % 2592000) / 86400 ))
hours=$(( (diff_sec % 86400) / 3600 ))
minutes=$(( (diff_sec % 3600) / 60 ))

output=""

[[ $years -gt 0 ]] && output+="${years}y "
[[ $months -gt 0 ]] && output+="${months}m "
[[ $days -gt 0 ]] && output+="${days}d "
[[ $hours -gt 0 ]] && output+="${hours}h "
[[ $minutes -gt 0 ]] && output+="${minutes}m"

echo "${output:-0m}"


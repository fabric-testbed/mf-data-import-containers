#!/bin/bash


backup_dir="./backup_snapshots"
snapshot_dir="./snapshots"

if [ $# -eq 0 ]
  then
    echo "Please enter the name of your snapshot tar file (inside backup_snapshots directory)"
    read snapshot_tar_name
  else
    snapshot_tar_name=$1
fi

mkdir temp_snapshot
tar -xvf "$backup_dir/$snapshot_tar_name" -C temp_snapshot/

# Loop through each directory within the temp snapshot folder
for dir in "./temp_snapshot"/*; do
    if [ -d "$dir" ]; then
        # Loop through each subdirectory within the current directory
        for sub_dir in "$dir"/*; do
            if [ -d "$sub_dir" ]; then
                cp -r "$sub_dir" "$snapshot_dir/"
            fi
        done
    fi
done

rm -rf temp_snapshot

echo "Successfully copied all snapshot data from $snapshot_tar_name into shared directory ($snapshot_dir)"


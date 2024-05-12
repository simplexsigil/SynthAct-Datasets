#!/bin/bash

# This script calculates the password for AMARV. You are required to accept the license terms of AMASS before making use of AMARV, for this reason we require you to download AMASS first. 
# You can then proceed to generate the password for AMARV based on the md5sums of multiple selected files in AMASS. Please  download the SMPL+H versions of AMASS for this.
# For any problem, please raise an issue on our github page: 

# Declare an array of selected file paths
file_paths=(
"ACCAD/ACCAD/Female1General_c3d/A10 - lie to crouch_poses.npz"
"BMLhandball/S01_Expert/shape.npz"
"BMLmovi/BMLmovi/Subject_11_F_MoSh/shape.npz"
"BMLrub/BioMotionLab_NTroje/rub001/0000_treadmill_norm_poses.npz"
"CMU/CMU/01/01_01_poses.npz"
"DanceDB/20120731_StefanosTheodorou/shape.npz"
"DFaust_67/DFaust_67/50002/50002_chicken_wings_poses.npz"
"EKUT/125/SLP101_poses.npz"
"EyesJapanDataset/Eyes_Japan_Dataset/aita/accident-02-dodge fast-aita_poses.npz"
"HumanEva/S1/Box_1_poses.npz"
"KIT/KIT/10/LeftTurn01_poses.npz"
"MPI_HDM05/bk/HDM_bk_01-01_01_120_poses.npz"
"MPI_Limits/03099/lar1_poses.npz"
"MPI_mosh/00008/misc_poses.npz"
"SFU/0005/0005_2FeetJump001_poses.npz"
"SSM_synced/20160330_03333/ankles_poses.npz"
"TCD_handMocap/ExperimentDatabase/BottleA_poses.npz"
"TotalCapture/TotalCapture/s1/acting1_poses.npz"
"Transitions_mocap/mazen_c3d/airkick_jumpingtwist360_poses.npz"
)

# Temporary file to hold the concatenated md5sums
md5_concat="md5_concat.txt"

# Function to calculate md5sum for each file and append to a temporary file
calculate_md5sums() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        local md5sum_value=$(md5sum "$file_path" | awk '{print $1}')
        echo "File: $file_path - md5sum: $md5sum_value"
        echo "$md5sum_value" >> "$md5_concat"
    else
        echo "File not found: $file_path"
        return 1  # Return from the function with an error code
    fi
}

# Function to concatenate and calculate final md5sum
calculate_final_md5sum() {
    local concat_md5sums=$(tr -d '\n' < "$md5_concat")
    echo "Concatenated md5sum: $concat_md5sums"
    local final_md5sum=$(echo -n "$concat_md5sums" | md5sum | awk '{print $1}')
    echo "Final md5sum of concatenated md5sums: $final_md5sum"
}

# Main execution block
main() {
    : > "$md5_concat"  # Ensure the md5_concat file is empty
    echo "Calculating md5sums for each file..."

    for file_path in "${file_paths[@]}"; do
        calculate_md5sums "$file_path" || return 1
    done

    calculate_final_md5sum

    # Optional: Clean up temporary file
    rm "$md5_concat"
}

# Determine if the script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
else
    echo "Script is being sourced, not executed."
fi


#!/bin/bash

# Declare an array : category
category=("Step_LSC" "Step_StandReportReceiver" "Step_SPUtils" "Step_ExtSDM" "HiH_" "HiH_HiAppUtil" "HiH_HiSyncControl" "HiH_HiHealthBinder" "HiH_DataStatManager" "HiH_HiBroadcastUtil")

analysis() {
    local up=$(uptime -p | cut -c4-)
    local since=$(uptime -s)
    local Date=$(date)
    cat << EOF

----------------------------------
This machine has been up for ${up} 
It has been running since ${since}
Todays Date ${Date}
File Name $(find . -name "*.log" -mtime -1)
----------------------------------

EOF

    # Loop through categories and count occurrences
    
    for cate in "${category[@]}"; do
        count=$(grep -c "$cate" "HealthApp_2k.log")
        echo "Total [ $cate ] in HealthApp: $count"
    done
}

# Call the function
analysis

echo "This Code is written by Ro706"


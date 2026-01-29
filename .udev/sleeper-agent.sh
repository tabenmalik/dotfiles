#!/bin/bash

plugged_in=$1

if [[ $plugged_in == 1 ]]
then
    echo s2idle > /sys/power/mem_sleep
else
    echo deep > /sys/power/mem_sleep
fi

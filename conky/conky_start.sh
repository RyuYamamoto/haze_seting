#!/bin/sh

killall conky
sleep 15


conky
conky -c /home/haze/.conkyrc_mv

#!/bin/env bash

wf-recorder \
	--audio="$(pactl list sources |
		grep 'Name' |
		grep 'monitor' |
		awk '{print $2}')" \
	-f "$1.mp4" \
	-c h264_vaapi \
	-d /dev/dri/renderD128

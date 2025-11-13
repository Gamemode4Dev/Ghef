

schedule function ghef:setup/tick_ball 1

execute as @e[type=marker,tag=ghef_ball,tag=ghef_moving] run function ghef:physics/ball/calculate_motion

# @s = ghef ball marker
# located at @s
# run from ghef:physics/ball/calculate_motion

tag @s add ghef_check
execute as @e[type=marker,tag=ghef_collision,distance=..25] run function ghef:physics/plane/check_ball_collision with entity @e[type=marker,tag=ghef_check,limit=1,distance=..0.01] data.ghef
tag @s remove ghef_check

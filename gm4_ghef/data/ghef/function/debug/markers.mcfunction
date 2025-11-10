# @s = none
# located at world spawn
# run from self and ghef:dev/toggle_markers

schedule function ghef:debug/markers 2t

execute at @e[type=marker,tag=ghef_ball] run particle minecraft:dust{color:[0, 1, 0], scale:1} ~ ~ ~ 0 0 0 0 2
execute at @a as @e[type=marker,tag=ghef_collision,distance=..50] run function ghef:debug/collision_markers/setup
execute as @e[tag=ghef_ball,tag=!ghef_moving] at @s run function ghef:physics/ball/check_plane_collision

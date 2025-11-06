# @s = closest collision marker
# located at player who ran the command
# run from ghef:dev/flip_collision_nearest

execute store result entity @s data.ghef.normal.x double 0.00001 run scoreboard players operation @s ghef_nx *= #-1 ghef_data
execute store result entity @s data.ghef.normal.y double 0.00001 run scoreboard players operation @s ghef_ny *= #-1 ghef_data
execute store result entity @s data.ghef.normal.z double 0.00001 run scoreboard players operation @s ghef_nz *= #-1 ghef_data

execute at @s run tp @s ~ ~ ~ facing ^ ^ ^-1

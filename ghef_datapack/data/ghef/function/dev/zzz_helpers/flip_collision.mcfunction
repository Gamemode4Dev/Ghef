# @s = closest collision marker
# located at player who ran the command
# run from ghef:dev/flip_collision_nearest

execute store result entity @s data.ghef.normal.x double 0.00001 run scoreboard players operation @s ghef_nx *= #-1 ghef_data
execute store result entity @s data.ghef.normal.y double 0.00001 run scoreboard players operation @s ghef_ny *= #-1 ghef_data
execute store result entity @s data.ghef.normal.z double 0.00001 run scoreboard players operation @s ghef_nz *= #-1 ghef_data

execute at @s run tp @s ~ ~ ~ facing ^ ^ ^-1

# store global unit vector coordinates
execute at @s positioned ^ ^ ^1 summon marker run function ghef:physics/util/get_coords
execute store result entity @s data.ghef.normal.X double 0.00001 store result score @s ghef_nX run data get storage ghef:data temp.Pos[0] 100000
execute store result entity @s data.ghef.normal.Y double 0.00001 store result score @s ghef_nY run data get storage ghef:data temp.Pos[1] 100000
execute store result entity @s data.ghef.normal.Z double 0.00001 store result score @s ghef_nZ run data get storage ghef:data temp.Pos[2] 100000

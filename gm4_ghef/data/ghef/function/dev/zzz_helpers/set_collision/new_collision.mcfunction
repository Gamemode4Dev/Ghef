# @s = new collision marker
# located at player who ran the command
# run from ghef:dev/set_collision

# set common data
data merge entity @s {CustomName:"Collision Plane",Tags:["ghef_collision"]}
execute store result score @s ghef_col_id run scoreboard players add new ghef_col_id 1
scoreboard players set @s ghef_level_id -1

# move to midpoint between pos1 and pos2
data modify storage ghef:data temp.pos1 set from entity @n[type=area_effect_cloud,tag=ghef_pos_1,distance=..50] Pos
data modify storage ghef:data temp.pos2 set from entity @n[type=area_effect_cloud,tag=ghef_pos_2,distance=..50] Pos

execute store result score p1 ghef_data run data get storage ghef:data temp.pos1[0] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos2[0] 100000
execute store result entity @s Pos[0] double 0.000005 run scoreboard players operation p1 ghef_data += p2 ghef_data

execute store result score p1 ghef_data run data get storage ghef:data temp.pos1[1] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos2[1] 100000
execute store result entity @s Pos[1] double 0.000005 run scoreboard players operation p1 ghef_data += p2 ghef_data

execute store result score p1 ghef_data run data get storage ghef:data temp.pos1[2] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos2[2] 100000
execute store result entity @s Pos[2] double 0.000005 run scoreboard players operation p1 ghef_data += p2 ghef_data

# store position data (also stored in entity data in case of scoreboard corruption)
data modify storage ghef:data temp.pos3 set from entity @n[type=area_effect_cloud,tag=ghef_pos_3,distance=..50] Pos
data modify storage ghef:data temp.posM set from entity @s Pos

execute store result score @s ghef_x run data get storage ghef:data temp.posM[0] 100000
execute store result score @s ghef_x1 store result entity @s data.ghef.corners.Ax double 0.00001 run data get storage ghef:data temp.pos1[0] 100000
execute store result score @s ghef_x2 store result entity @s data.ghef.corners.Cx double 0.00001 run data get storage ghef:data temp.pos2[0] 100000
execute store result score @s ghef_x3 store result entity @s data.ghef.corners.Bx double 0.00001 run data get storage ghef:data temp.pos3[0] 100000

execute store result score @s ghef_y run data get storage ghef:data temp.posM[1] 100000
execute store result score @s ghef_y1 store result entity @s data.ghef.corners.Ay double 0.00001 run data get storage ghef:data temp.pos1[1] 100000
execute store result score @s ghef_y2 store result entity @s data.ghef.corners.Cy double 0.00001 run data get storage ghef:data temp.pos2[1] 100000
execute store result score @s ghef_y3 store result entity @s data.ghef.corners.By double 0.00001 run data get storage ghef:data temp.pos3[1] 100000

execute store result score @s ghef_z run data get storage ghef:data temp.posM[2] 100000
execute store result score @s ghef_z1 store result entity @s data.ghef.corners.Az double 0.00001 run data get storage ghef:data temp.pos1[2] 100000
execute store result score @s ghef_z2 store result entity @s data.ghef.corners.Cz double 0.00001 run data get storage ghef:data temp.pos2[2] 100000
execute store result score @s ghef_z3 store result entity @s data.ghef.corners.Bz double 0.00001 run data get storage ghef:data temp.pos3[2] 100000

#   calculate 4th corner based on midpoint and 3rd corner
execute store result score p1 ghef_data run data get storage ghef:data temp.posM[0] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos3[0] 100000
scoreboard players operation p2 ghef_data -= p1 ghef_data
execute store result score @s ghef_x4 store result entity @s data.ghef.corners.Dx double 0.00001 run scoreboard players operation p1 ghef_data -= p2 ghef_data

execute store result score p1 ghef_data run data get storage ghef:data temp.posM[1] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos3[1] 100000
scoreboard players operation p2 ghef_data -= p1 ghef_data
execute store result score @s ghef_y4 store result entity @s data.ghef.corners.Dy double 0.00001 run scoreboard players operation p1 ghef_data -= p2 ghef_data

execute store result score p1 ghef_data run data get storage ghef:data temp.posM[2] 100000
execute store result score p2 ghef_data run data get storage ghef:data temp.pos3[2] 100000
scoreboard players operation p2 ghef_data -= p1 ghef_data
execute store result score @s ghef_z4 store result entity @s data.ghef.corners.Dz double 0.00001 run scoreboard players operation p1 ghef_data -= p2 ghef_data

# compute normal vector
function ghef:dev/zzz_helpers/set_collision/set_normal

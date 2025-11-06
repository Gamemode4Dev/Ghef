# @s = new collision pos 3
# located at player who ran the command
# run from ghef:dev/set_collision

data merge entity @s {CustomName:"Collision Pos 3",Radius:0.001f,Duration:600,Tags:["ghef_pos_3","ghef_pos"],custom_particle:{type:"dust",color:[0.471,0.541,1.000],scale:1}}

# get coords of existing corners
data modify storage ghef:data temp.pos1 set from entity @n[type=area_effect_cloud,tag=ghef_pos_1,distance=..50] Pos
data modify storage ghef:data temp.pos2 set from entity @n[type=area_effect_cloud,tag=ghef_pos_2,distance=..50] Pos
execute store result score new ghef_y1 run data get storage ghef:data temp.pos1[1] 10
execute store result score new ghef_y2 run data get storage ghef:data temp.pos2[1] 10

# if y is the same (to the nearest tenth of a block), assume horizontal plane (i.e. floor/ceiling)
execute if score new ghef_y1 = new ghef_y2 run data modify entity @s Pos[0] set from storage ghef:data temp.pos1[0]
execute if score new ghef_y1 = new ghef_y2 run data modify entity @s Pos[1] set from storage ghef:data temp.pos1[1]
execute if score new ghef_y1 = new ghef_y2 run return run data modify entity @s Pos[2] set from storage ghef:data temp.pos2[2]

# if y is not the same, assume verical plane (i.e. wall)
data modify entity @s Pos[0] set from storage ghef:data temp.pos2[0]
data modify entity @s Pos[1] set from storage ghef:data temp.pos1[1]
data modify entity @s Pos[2] set from storage ghef:data temp.pos2[2]

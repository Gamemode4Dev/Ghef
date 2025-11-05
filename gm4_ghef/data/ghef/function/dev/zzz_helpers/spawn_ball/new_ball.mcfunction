# @s = new ball marker
# located at @s
# run from ghef:dev/spawn_ball

data merge entity @s {Tags:["ghef_ball"],CustomName:"Ghef Ball"}
execute store result score @s ghef_x run data get entity @s Pos[0] 100000
execute store result score @s ghef_y run data get entity @s Pos[1] 100000
execute store result score @s ghef_z run data get entity @s Pos[2] 100000
scoreboard players set @s ghef_level_id -1

# @s = new ball marker
# located at @s
# run from ghef:dev/spawn_ball

data merge entity @s {Tags:["ghef_ball"],CustomName:"Ghef Ball"}

execute store result score @s ghef_x run data get entity @s Pos[0] 100000
execute store result score @s ghef_y run data get entity @s Pos[1] 100000
execute store result score @s ghef_z run data get entity @s Pos[2] 100000

scoreboard players set @s ghef_vx 0
scoreboard players set @s ghef_vy 0
scoreboard players set @s ghef_vz 0

scoreboard players set @s ghef_level_id -1
execute store result entity @s data.ghef.radius double 0.00001 run scoreboard players set @s ghef_radius 25000
execute store result entity @s data.ghef.gravity double 0.00001 run scoreboard players set @s ghef_gravity 2500
execute store result entity @s data.ghef.cor double 0.00001 run scoreboard players set @s ghef_cor 65000
execute store result entity @s data.ghef.friction double 0.00001 run scoreboard players set @s ghef_friction 100

# @s = ghef ball marker
# located at @s
# run from ghef:physics/ball/calculate_motion

tag @s add ghef_check

# debug for axiom moving ball around
execute store result score @s ghef_x run data get entity @s Pos[0] 100000
execute store result score @s ghef_y run data get entity @s Pos[1] 100000
execute store result score @s ghef_z run data get entity @s Pos[2] 100000

scoreboard players operation ball_x ghef_calc = @s ghef_x
scoreboard players operation ball_y ghef_calc = @s ghef_y
scoreboard players operation ball_z ghef_calc = @s ghef_z
scoreboard players operation radius ghef_calc = @s ghef_radius

tag @e[tag=ghef_collision,distance=..25] remove ghef_colliding
execute as @e[type=marker,tag=ghef_collision,distance=..25] run function ghef:physics/plane/check_ball_collision
tag @s remove ghef_check

execute unless entity @e[type=marker,tag=ghef_colliding,distance=..25,limit=1] run return fail

execute if score markers ghef_data matches 1 run particle end_rod ~ ~ ~ 0 0 0 0 1

return 1

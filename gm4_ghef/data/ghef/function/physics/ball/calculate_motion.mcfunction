# @s = ghef ball that is moving
# located at world spawn
# run from ghef:setup/tick_ball

# dampen motion less than 500 (0.005 blocks per tick)
scoreboard players set @s[scores={ghef_vx=-500..500}] ghef_vx 0
scoreboard players set @s[scores={ghef_vy=-500..500}] ghef_vy 0
scoreboard players set @s[scores={ghef_vz=-500..500}] ghef_vz 0
execute if entity @s[scores={ghef_vx=-500..500,ghef_vy=-500..500,ghef_vz=-500..500}] run return run tag @s remove ghef_moving

# cap motion to be less than radius
scoreboard players operation radius ghef_calc = @s ghef_radius
scoreboard players remove radius ghef_calc 100
scoreboard players operation @s ghef_vx < radius ghef_calc
scoreboard players operation @s ghef_vy < radius ghef_calc
scoreboard players operation @s ghef_vz < radius ghef_calc

scoreboard players operation radius ghef_calc *= #-1 ghef_data
scoreboard players operation @s ghef_vx > radius ghef_calc
scoreboard players operation @s ghef_vy > radius ghef_calc
scoreboard players operation @s ghef_vz > radius ghef_calc

# check collisions
execute at @s run function ghef:physics/ball/check_plane_collision

# apply motion
execute store result entity @s Pos[0] double 0.00001 run scoreboard players operation @s ghef_x += @s ghef_vx
execute store result entity @s Pos[1] double 0.00001 run scoreboard players operation @s ghef_y += @s ghef_vy
execute store result entity @s Pos[2] double 0.00001 run scoreboard players operation @s ghef_z += @s ghef_vz

# kill balls that fall out of the world
execute at @s run kill @s[dx=-1,dz=-1,y=-20,dy=10]

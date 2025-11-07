# @s = ghef ball that is moving
# located at world spawn
# run from ghef:setup/tick_ball

# dampen motion less than 500
scoreboard players set @s[scores={ghef_vx=-500..500}] ghef_vx 0
scoreboard players set @s[scores={ghef_vy=-500..500}] ghef_vy 0
scoreboard players set @s[scores={ghef_vz=-500..500}] ghef_vz 0
tag @s[scores={ghef_vx=-500..500,ghef_vy=-500..500,ghef_vz=-500..500}] remove ghef_moving

# apply motion
execute unless score @s ghef_vy matches -500..500 run function ghef:physics/ball/move_y

# check collisions
execute at @s run function ghef:physics/ball/check_plane_collision

# kill balls that fall out of the world
execute at @s run kill @s[dx=-1,dz=-1,y=-20,dy=10]

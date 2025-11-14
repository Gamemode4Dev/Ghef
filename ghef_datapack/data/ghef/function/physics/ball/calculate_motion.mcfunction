# @s = ghef ball that is moving
# located at world spawn
# run from ghef:setup/tick_ball

# apply friction
#    apply friction in x direction
scoreboard players operation rolling_x ghef_calc = @s ghef_vx
execute if score rolling_x ghef_calc matches 1.. run scoreboard players set @s[scores={ghef_vx=..500}] ghef_vx 0
execute if score rolling_x ghef_calc matches ..-1 run scoreboard players set @s[scores={ghef_vx=-500..}] ghef_vx 0
execute unless score @s ghef_vx matches 0 run scoreboard players operation @s[tag=ghef_on_ground] ghef_vx -= @s ghef_fx
execute unless score @s ghef_vx matches 0 run scoreboard players operation @s[tag=!ghef_on_ground] ghef_vx -= @s ghef_fx_air

#    apply friction in z direction
scoreboard players operation rolling_z ghef_calc = @s ghef_vz
execute if score rolling_z ghef_calc matches 1.. run scoreboard players set @s[scores={ghef_vz=..500}] ghef_vz 0
execute if score rolling_z ghef_calc matches ..-1 run scoreboard players set @s[scores={ghef_vz=-500..}] ghef_vz 0
execute unless score @s ghef_vz matches 0 run scoreboard players operation @s[tag=ghef_on_ground] ghef_vz -= @s ghef_fz
execute unless score @s ghef_vz matches 0 run scoreboard players operation @s[tag=!ghef_on_ground] ghef_vz -= @s ghef_fz_air

# check collisions and apply gravity
execute unless entity @s[scores={ghef_vy=-500..500}] run tag @s remove ghef_on_ground
execute if score debug_y ghef_data matches 1 run tellraw @a [{text:"Y="},{score:{name:"@s",objective:"ghef_y"},color:"aqua"},{text:" VY="},{score:{name:"@s",objective:"ghef_vy"},color:"light_purple"},{text:" (before collision)"}]
execute at @s run function ghef:physics/ball/check_plane_collision
scoreboard players operation @s[tag=!ghef_on_ground] ghef_vy -= @s ghef_gravity
execute if score debug_y ghef_data matches 1 run tellraw @a [{text:"Y="},{score:{name:"@s",objective:"ghef_y"},color:"aqua"},{text:" VY="},{score:{name:"@s",objective:"ghef_vy"},color:"light_purple"},{text:" (after collision/gravity)"}]

# ignore motion less than 500 (0.005 blocks per tick)
execute if entity @s[tag=ghef_on_ground,scores={ghef_vx=0,ghef_vz=0}] run return run tag @s remove ghef_moving

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

# apply motion
execute if score debug_y ghef_data matches 1 run tellraw @a [{text:"Y="},{score:{name:"@s",objective:"ghef_y"},color:"aqua"},{text:" VY="},{score:{name:"@s",objective:"ghef_vy"},color:"light_purple"},{text:" (after motion cap)"}]
execute store result entity @s Pos[0] double 0.00001 run scoreboard players operation @s ghef_x += @s ghef_vx
execute store result entity @s Pos[1] double 0.00001 run scoreboard players operation @s ghef_y += @s ghef_vy
execute store result entity @s Pos[2] double 0.00001 run scoreboard players operation @s ghef_z += @s ghef_vz
execute if score debug_y ghef_data matches 1 run tellraw @a [{text:"Y="},{score:{name:"@s",objective:"ghef_y"},color:"aqua"},{text:" VY="},{score:{name:"@s",objective:"ghef_vy"},color:"light_purple"},{text:" (after motion apply)"}]
execute if score debug_y ghef_data matches 1 run tellraw @a [{text:"--------------------",color:"blue"}]

# kill balls that fall out of the world
execute at @s run kill @s[dx=-1,dz=-1,y=-20,dy=10]

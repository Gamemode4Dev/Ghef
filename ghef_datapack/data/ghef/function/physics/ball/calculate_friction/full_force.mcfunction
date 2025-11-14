# @s = ghef ball that is moving
# located at world spawn
# run from ghef:physics/ball/calculate_friction

scoreboard players operation @s ghef_fx = @s ghef_friction
scoreboard players operation @s ghef_fx_air = @s ghef_air_friction
scoreboard players operation @s ghef_fz = @s ghef_friction
scoreboard players operation @s ghef_fz_air = @s ghef_air_friction

execute if score @s ghef_vx matches ..-1 run scoreboard players operation @s ghef_fx *= #-1 ghef_data
execute if score @s ghef_vx matches ..-1 run scoreboard players operation @s ghef_fx_air *= #-1 ghef_data
execute if score @s ghef_vz matches ..-1 run scoreboard players operation @s ghef_fz *= #-1 ghef_data
execute if score @s ghef_vz matches ..-1 run scoreboard players operation @s ghef_fz_air *= #-1 ghef_data

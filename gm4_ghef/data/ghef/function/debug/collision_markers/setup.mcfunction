# @s = collision marker
# located at @a (irrelevant)
# run from ghef:debug/markers

# set up macro
data modify storage ghef:data temp.corners set from entity @s data.ghef.corners

# if x or z is an int, add a small amount so `positioned` doesn't align to center of block
execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Ax
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Ax double 0.00001 run scoreboard players add val ghef_calc 1
execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Az
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Az double 0.00001 run scoreboard players add val ghef_calc 1

execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Cx
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Cx double 0.00001 run scoreboard players add val ghef_calc 1
execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Cz
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Cz double 0.00001 run scoreboard players add val ghef_calc 1

execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Bx
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Bx double 0.00001 run scoreboard players add val ghef_calc 1
execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Bz
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Bz double 0.00001 run scoreboard players add val ghef_calc 1

execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Dx
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Dx double 0.00001 run scoreboard players add val ghef_calc 1
execute store result score val ghef_calc run scoreboard players operation check ghef_calc = @s ghef_Dz
scoreboard players operation check ghef_calc %= #100000 ghef_data
execute if score check ghef_calc matches 0 store result storage ghef:data temp.corners.Dz double 0.00001 run scoreboard players add val ghef_calc 1

# draw particles
execute at @s[tag=ghef_collision_triangle] run function ghef:debug/collision_markers/particle_triangle with storage ghef:data temp.corners
execute at @s[tag=!ghef_collision_triangle] run function ghef:debug/collision_markers/particle with storage ghef:data temp.corners
data remove storage ghef:data temp

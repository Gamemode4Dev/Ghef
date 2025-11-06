# @s = collision marker
# located at @a (irrelevant)
# run from ghef:debug/markers

# set up macro
data modify storage ghef:data temp.macro set from entity @s data.ghef.corners

# if x or z is an int, add a small amount so `positioned` doesn't align to center of block
execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_x1
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Ax double 0.00001 run scoreboard players add val ghef_data 1
execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_z1
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Az double 0.00001 run scoreboard players add val ghef_data 1

execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_x2
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Cx double 0.00001 run scoreboard players add val ghef_data 1
execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_z2
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Cz double 0.00001 run scoreboard players add val ghef_data 1

execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_x3
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Bx double 0.00001 run scoreboard players add val ghef_data 1
execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_z3
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Bz double 0.00001 run scoreboard players add val ghef_data 1

execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_x4
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Dx double 0.00001 run scoreboard players add val ghef_data 1
execute store result score val ghef_data run scoreboard players operation check ghef_data = @s ghef_z4
scoreboard players operation check ghef_data %= #100000 ghef_data
execute if score check ghef_data matches 0 store result storage ghef:data temp.macro.Dz double 0.00001 run scoreboard players add val ghef_data 1

# draw particles
execute at @s[tag=ghef_collision_triangle] run function ghef:debug/collision_markers/particle_triangle with storage ghef:data temp.macro
execute at @s[tag=!ghef_collision_triangle] run function ghef:debug/collision_markers/particle with storage ghef:data temp.macro
data remove storage ghef:data temp.macro

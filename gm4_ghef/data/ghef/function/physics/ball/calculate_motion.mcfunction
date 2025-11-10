# @s = ghef ball that is moving
# located at world spawn
# run from ghef:setup/tick_ball

# dampen motion less than 500
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

# apply motion
execute store result entity @s Pos[0] double 0.00001 run scoreboard players operation @s ghef_x += @s ghef_vx
execute store result entity @s Pos[1] double 0.00001 run scoreboard players operation @s ghef_y += @s ghef_vy
execute store result entity @s Pos[2] double 0.00001 run scoreboard players operation @s ghef_z += @s ghef_vz

# check collisions
execute at @s unless function ghef:physics/ball/check_plane_collision run return fail

# multiply velocity by normal of the plane it hit => ball velocity - (2 * dot(ball velocity , plane normal) * plane normal)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get @s ghef_vx
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get @s ghef_vy
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get @s ghef_vz
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x ghef_calc += y ghef_calc
scoreboard players operation x ghef_calc += z ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get x ghef_calc


execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x ghef_calc run data get storage ghef:data temp.value 200000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 200000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @e[type=marker,tag=ghef_colliding,limit=1] ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 200000

scoreboard players operation @s ghef_vx -= x ghef_calc
scoreboard players operation @s ghef_vy -= y ghef_calc
scoreboard players operation @s ghef_vz -= z ghef_calc

# kill balls that fall out of the world
execute at @s run kill @s[dx=-1,dz=-1,y=-20,dy=10]

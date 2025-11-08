# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/ball/check_plane_collision
# run with entity <ghef ball marker> data.ghef

# check is ball intersects (infinite) plane
#    shortest distance <D> = dot(point on plane <B> - center of ball <ball_>, normal unit vector of plane <N>)
scoreboard players operation Bx ghef_calc = @s ghef_x
scoreboard players operation By ghef_calc = @s ghef_y
scoreboard players operation Bz ghef_calc = @s ghef_z

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation Bx ghef_calc -= ball_x ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score D ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation By ghef_calc -= ball_y ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation Bz ghef_calc -= ball_z ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation D ghef_calc += y ghef_calc
scoreboard players operation D ghef_calc += z ghef_calc

#    check if distance from center of ball to closest point on plane <D> is less than radius of ball
execute if score D ghef_calc > radius ghef_calc run return fail
scoreboard players operation radius ghef_calc *= #-1 ghef_data
execute if score D ghef_calc < radius ghef_calc run return fail

execute at @s run particle flame ~ ~ ~ 0 0 0 0 1
return run tag @s add ghef_colliding

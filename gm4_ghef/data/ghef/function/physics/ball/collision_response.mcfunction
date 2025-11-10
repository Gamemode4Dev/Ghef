# @s = collision plane that the ball hit
# located at the ball
# run from ghef:physics/ball/calculate_motion

# multiply velocity by penetration normal of the plane it hit => ball velocity - (2 * dot(ball velocity , penetration normal) * penetration normal)
#    calculate dot product
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get ball_vx ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_px
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get ball_vy ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_py
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get ball_vz ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_pz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x ghef_calc += y ghef_calc
scoreboard players operation x ghef_calc += z ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get x ghef_calc

#    calculate change in velocity
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_px
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score dvx ghef_calc run data get storage ghef:data temp.value 200000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_py
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score dvy ghef_calc run data get storage ghef:data temp.value 200000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_pz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score dvz ghef_calc run data get storage ghef:data temp.value 200000

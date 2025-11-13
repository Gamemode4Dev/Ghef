# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision/check_points/c0
#      and ghef:physics/plane/check_ball_collision/check_points/c1
#      and ghef:physics/plane/check_ball_collision/check_points/c2

# calculate cross product
#    Vx = a * b
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get a ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get b ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score Vx ghef_calc run data get storage ghef:data temp.value 100000
#    g = c * d
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get c ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get d ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
#    Vx = a * b - c * d = Vx - g
scoreboard players operation Vx ghef_calc -= g ghef_calc

#    Vy = c * e
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get c ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get e ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score Vy ghef_calc run data get storage ghef:data temp.value 100000
#    g = f * b
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get f ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get b ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
#    Vy = c * e - f * b = Vy - g
scoreboard players operation Vy ghef_calc -= g ghef_calc

#    Vz = f * d
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get f ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get d ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score Vz ghef_calc run data get storage ghef:data temp.value 100000
#    g = a * e
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get a ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get e ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
#    Vz = f * d - a * e = Vz - g
scoreboard players operation Vz ghef_calc -= g ghef_calc


# return dot(V, normal vector)
#    VxNx + VyNy + VzNz
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get Vx ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x ghef_calc run data get storage ghef:data temp.value 100

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get Vy ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 100

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get Vz ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 100

scoreboard players operation x ghef_calc += y ghef_calc
return run scoreboard players operation x ghef_calc += z ghef_calc

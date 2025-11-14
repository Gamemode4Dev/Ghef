# @s = ghef ball marker
# located at @s
# run from ghef:physics/ball/check_plane_collision

# get velocity magnitude
execute store result storage ghef:data temp.pos.x double 0.00001 run scoreboard players get @s ghef_vx
data modify storage ghef:data temp.pos.y set value 0.0d
execute store result storage ghef:data temp.pos.z double 0.00001 run scoreboard players get @s ghef_vz
execute summon item_display run function ghef:math/zzz_helpers/distance/calculate with storage ghef:data temp.pos
execute store result score mag ghef_calc run data get storage ghef:data temp.distance 100

# if magnitude is too low, apply fully to both axes
execute if score mag ghef_calc matches 0 run return run function ghef:physics/ball/calculate_friction/full_force


# calculate friction in x direction
#    get x component of velocity
scoreboard players operation x ghef_calc = @s ghef_vx
execute store result storage ghef:data temp.mul.a double 0.001 run scoreboard players operation x ghef_calc /= mag ghef_calc

#    calculate ground friction
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_friction
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score @s ghef_fx run data get storage ghef:data temp.value 100000

#    calculate air friction
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_air_friction
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score @s ghef_fx_air run data get storage ghef:data temp.value 100000


# calculate friction in z direction
#    get z component of velocity
scoreboard players operation z ghef_calc = @s ghef_vz
execute store result storage ghef:data temp.mul.a double 0.001 run scoreboard players operation z ghef_calc /= mag ghef_calc

#    calculate ground friction
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_friction
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score @s ghef_fz run data get storage ghef:data temp.value 100000

#    calculate air friction
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_air_friction
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score @s ghef_fz_air run data get storage ghef:data temp.value 100000

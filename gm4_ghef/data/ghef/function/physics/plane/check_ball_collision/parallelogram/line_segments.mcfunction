# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision/check_line_segments


# find closest point to segment CD
# D + ( min( (max( ((DP • CD) / (CD • CD)) , 0 ) , 1) * CD )
#    DP • CD
scoreboard players operation CDx ghef_calc = @s ghef_Cx
scoreboard players operation CDy ghef_calc = @s ghef_Cy
scoreboard players operation CDz ghef_calc = @s ghef_Cz
scoreboard players operation DPx ghef_calc = Px ghef_calc
scoreboard players operation DPy ghef_calc = Py ghef_calc
scoreboard players operation DPz ghef_calc = Pz ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation DPx ghef_calc -= @s ghef_Dx
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CDx ghef_calc -= @s ghef_Dx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation DPy ghef_calc -= @s ghef_Dy
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CDy ghef_calc -= @s ghef_Dy
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation DPz ghef_calc -= @s ghef_Dz
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CDz ghef_calc -= @s ghef_Dz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z1 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x1 ghef_calc += y1 ghef_calc
scoreboard players operation x1 ghef_calc += z1 ghef_calc

#    CD • CD
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z2 ghef_calc run data get storage ghef:data temp.value 1

scoreboard players operation x2 ghef_calc += y2 ghef_calc
scoreboard players operation x2 ghef_calc += z2 ghef_calc

# (DP • CD) / (CD • CD)
scoreboard players operation x1 ghef_calc /= x2 ghef_calc

# min( (max( ((DP • CD) / (CD • CD)) , 0 ) , 1)
scoreboard players operation x1 ghef_calc > #0 ghef_data
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation x1 ghef_calc < #100000 ghef_data


# min( (max( ((DP • CD) / (CD • CD)) , 0 ) , 1) * CD
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CDz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z3 ghef_calc run data get storage ghef:data temp.value 100000


# D + ( min( (max( ((DP • CD) / (CD • CD)) , 0 ) , 1) * CD )
scoreboard players operation x3 ghef_calc += @s ghef_Dx
scoreboard players operation y3 ghef_calc += @s ghef_Dy
scoreboard players operation z3 ghef_calc += @s ghef_Dz

# check closest point to segment CD
#    distance^2 = (closest point - ball center) • (closest point - ball center)
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation x3 ghef_calc -= ball_x ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score distance_squared ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation y3 ghef_calc -= ball_y ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y4 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation z3 ghef_calc -= ball_z ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z4 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation distance_squared ghef_calc += y4 ghef_calc
scoreboard players operation distance_squared ghef_calc += z4 ghef_calc

execute if score distance_squared ghef_calc < radius_squared ghef_calc run return run scoreboard players set inside ghef_calc 2



# find closest point to segment AD
# D + ( min( (max( ((DP • AD) / (AD • AD)) , 0 ) , 1) * AD )
#    DP • AD
scoreboard players operation ADx ghef_calc = @s ghef_Ax
scoreboard players operation ADy ghef_calc = @s ghef_Ay
scoreboard players operation ADz ghef_calc = @s ghef_Az

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get DPx ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ADx ghef_calc -= @s ghef_Dx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get DPy ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ADy ghef_calc -= @s ghef_Dy
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get DPz ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ADz ghef_calc -= @s ghef_Dz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z1 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x1 ghef_calc += y1 ghef_calc
scoreboard players operation x1 ghef_calc += z1 ghef_calc

#    AD • AD
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z2 ghef_calc run data get storage ghef:data temp.value 1

scoreboard players operation x2 ghef_calc += y2 ghef_calc
scoreboard players operation x2 ghef_calc += z2 ghef_calc

# (DP • AD) / (AD • AD)
scoreboard players operation x1 ghef_calc /= x2 ghef_calc

# min( (max( ((DP • AD) / (AD • AD)) , 0 ) , 1)
scoreboard players operation x1 ghef_calc > #0 ghef_data
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation x1 ghef_calc < #100000 ghef_data


# min( (max( ((DP • AD) / (AD • AD)) , 0 ) , 1) * AD
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ADz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z3 ghef_calc run data get storage ghef:data temp.value 100000


# D + ( min( (max( ((DP • AD) / (AD • AD)) , 0 ) , 1) * AD )
scoreboard players operation x3 ghef_calc += @s ghef_Dx
scoreboard players operation y3 ghef_calc += @s ghef_Dy
scoreboard players operation z3 ghef_calc += @s ghef_Dz

# check closest point to segment AD
#    distance^2 = (closest point - ball center) • (closest point - ball center)
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation x3 ghef_calc -= ball_x ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score distance_squared ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation y3 ghef_calc -= ball_y ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y4 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation z3 ghef_calc -= ball_z ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z4 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation distance_squared ghef_calc += y4 ghef_calc
scoreboard players operation distance_squared ghef_calc += z4 ghef_calc

execute if score distance_squared ghef_calc < radius_squared ghef_calc run scoreboard players set inside ghef_calc 2

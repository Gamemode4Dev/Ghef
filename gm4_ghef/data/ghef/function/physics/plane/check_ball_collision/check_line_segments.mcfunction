# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# get radius squared for distance comparisons
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get radius ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score radius_squared ghef_calc run data get storage ghef:data temp.value 100000


# find closest point to segment AB
# A + ( min( (max( ((AP • AB) / (AB • AB)) , 0 ) , 1) * AB )
#    AP • AB
scoreboard players operation ABx ghef_calc = @s ghef_Bx
scoreboard players operation ABy ghef_calc = @s ghef_By
scoreboard players operation ABz ghef_calc = @s ghef_Bz
scoreboard players operation APx ghef_calc = Px ghef_calc
scoreboard players operation APy ghef_calc = Py ghef_calc
scoreboard players operation APz ghef_calc = Pz ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation APx ghef_calc -= @s ghef_Ax
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ABx ghef_calc -= @s ghef_Ax
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation APy ghef_calc -= @s ghef_Ay
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ABy ghef_calc -= @s ghef_Ay
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation APz ghef_calc -= @s ghef_Az
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ABz ghef_calc -= @s ghef_Az
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z1 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x1 ghef_calc += y1 ghef_calc
scoreboard players operation x1 ghef_calc += z1 ghef_calc

#    AB • AB
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z2 ghef_calc run data get storage ghef:data temp.value 1

scoreboard players operation x2 ghef_calc += y2 ghef_calc
scoreboard players operation x2 ghef_calc += z2 ghef_calc

# (AP • AB) / (AB • AB)
scoreboard players operation x1 ghef_calc /= x2 ghef_calc

# min( (max( ((AP • AB) / (AB • AB)) , 0 ) , 1)
scoreboard players operation x1 ghef_calc > #0 ghef_data
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation x1 ghef_calc < #100000 ghef_data


# min( (max( ((AP • AB) / (AB • AB)) , 0 ) , 1) * AB
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ABz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z3 ghef_calc run data get storage ghef:data temp.value 100000


# A + ( min( (max( ((AP • AB) / (AB • AB)) , 0 ) , 1) * AB )
scoreboard players operation x3 ghef_calc += @s ghef_Ax
scoreboard players operation y3 ghef_calc += @s ghef_Ay
scoreboard players operation z3 ghef_calc += @s ghef_Az

# check closest point to segment AB
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



# find closest point to segment AC
# A + ( min( (max( ((AP • AC) / (AC • AC)) , 0 ) , 1) * AC )
#    AP • AC
scoreboard players operation ACx ghef_calc = @s ghef_Cx
scoreboard players operation ACy ghef_calc = @s ghef_Cy
scoreboard players operation ACz ghef_calc = @s ghef_Cz

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get APx ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ACx ghef_calc -= @s ghef_Ax
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get APy ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ACy ghef_calc -= @s ghef_Ay
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get APz ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation ACz ghef_calc -= @s ghef_Az
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z1 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x1 ghef_calc += y1 ghef_calc
scoreboard players operation x1 ghef_calc += z1 ghef_calc

#    AC • AC
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z2 ghef_calc run data get storage ghef:data temp.value 1

scoreboard players operation x2 ghef_calc += y2 ghef_calc
scoreboard players operation x2 ghef_calc += z2 ghef_calc

# (AP • AC) / (AC • AC)
scoreboard players operation x1 ghef_calc /= x2 ghef_calc

# min( (max( ((AP • AC) / (AC • AC)) , 0 ) , 1)
scoreboard players operation x1 ghef_calc > #0 ghef_data
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation x1 ghef_calc < #100000 ghef_data


# min( (max( ((AP • AC) / (AC • AC)) , 0 ) , 1) * AC
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get ACz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z3 ghef_calc run data get storage ghef:data temp.value 100000


# A + ( min( (max( ((AP • AC) / (AC • AC)) , 0 ) , 1) * AC )
scoreboard players operation x3 ghef_calc += @s ghef_Ax
scoreboard players operation y3 ghef_calc += @s ghef_Ay
scoreboard players operation z3 ghef_calc += @s ghef_Az

# check closest point to segment AC
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



# find closest point to segment CB
# B + ( min( (max( ((BP • CB) / (CB • CB)) , 0 ) , 1) * CB )
#    BP • CB
scoreboard players operation CBx ghef_calc = @s ghef_Cx
scoreboard players operation CBy ghef_calc = @s ghef_Cy
scoreboard players operation CBz ghef_calc = @s ghef_Cz
scoreboard players operation BPx ghef_calc = Px ghef_calc
scoreboard players operation BPy ghef_calc = Py ghef_calc
scoreboard players operation BPz ghef_calc = Pz ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation BPx ghef_calc -= @s ghef_Bx
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CBx ghef_calc -= @s ghef_Bx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation BPy ghef_calc -= @s ghef_By
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CBy ghef_calc -= @s ghef_By
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y1 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation BPz ghef_calc -= @s ghef_Bz
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation CBz ghef_calc -= @s ghef_Bz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z1 ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x1 ghef_calc += y1 ghef_calc
scoreboard players operation x1 ghef_calc += z1 ghef_calc

#    CB • CB
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y2 ghef_calc run data get storage ghef:data temp.value 1

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z2 ghef_calc run data get storage ghef:data temp.value 1

scoreboard players operation x2 ghef_calc += y2 ghef_calc
scoreboard players operation x2 ghef_calc += z2 ghef_calc

# (BP • CB) / (CB • CB)
scoreboard players operation x1 ghef_calc /= x2 ghef_calc

# min( (max( ((BP • CB) / (CB • CB)) , 0 ) , 1)
scoreboard players operation x1 ghef_calc > #0 ghef_data
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation x1 ghef_calc < #100000 ghef_data


# min( (max( ((BP • CB) / (CB • CB)) , 0 ) , 1) * CB
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBx ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score x3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBy ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y3 ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get CBz ghef_calc
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z3 ghef_calc run data get storage ghef:data temp.value 100000


# B + ( min( (max( ((BP • CB) / (CB • CB)) , 0 ) , 1) * CB )
scoreboard players operation x3 ghef_calc += @s ghef_Bx
scoreboard players operation y3 ghef_calc += @s ghef_By
scoreboard players operation z3 ghef_calc += @s ghef_Bz

# check closest point to segment CB
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


# check closest points to CD and AD
execute unless entity @s[tag=ghef_collision_triangle] run function ghef:physics/plane/check_ball_collision/parallelogram/line_segments

# @s = new collision marker
# located at player who ran the command
# run from ghef:dev/zzz_helpers/set_collision/new_collision


###
# n_x = (By - Ay)(Cz - Az) - (Bz - Az)(Cy - Ay)
# n_y = (Bz - Az)(Cx - Ax) - (Bx - Ax)(Cz - Az)
# n_z = (Bx - Ax)(Cy - Ay) - (By - Ay)(Cx - Ax)
#
# A = corner 1, B = corner 3, C = corner 2
###

# a = By - Ay
scoreboard players operation a ghef_calc = @s ghef_y3
scoreboard players operation a ghef_calc -= @s ghef_y1
# b = Cz - Az
scoreboard players operation b ghef_calc = @s ghef_z2
scoreboard players operation b ghef_calc -= @s ghef_z1
# c = Bz - Az
scoreboard players operation c ghef_calc = @s ghef_z3
scoreboard players operation c ghef_calc -= @s ghef_z1
# d = Cy - Ay
scoreboard players operation d ghef_calc = @s ghef_y2
scoreboard players operation d ghef_calc -= @s ghef_y1
# e = Cx - Ax
scoreboard players operation e ghef_calc = @s ghef_x2
scoreboard players operation e ghef_calc -= @s ghef_x1
# f = Bx - Ax
scoreboard players operation f ghef_calc = @s ghef_x3
scoreboard players operation f ghef_calc -= @s ghef_x1


# A = (By - Ay)(Cz - Az)
scoreboard players operation @s ghef_nx = a ghef_calc
scoreboard players operation @s ghef_nx *= b ghef_calc
# B = (Bz - Az)(Cy - Ay)
scoreboard players operation B ghef_calc = c ghef_calc
scoreboard players operation B ghef_calc *= d ghef_calc
# A = (By - Ay)(Cz - Az) - (Bz - Az)(Cy - Ay)
execute store result storage ghef:data temp.macro.x float 0.00001 run scoreboard players operation @s ghef_nx -= B ghef_calc

# A = (Bz - Az)(Cx - Ax)
scoreboard players operation @s ghef_ny = c ghef_calc
scoreboard players operation @s ghef_ny *= e ghef_calc
# B = (Bx - Ax)(Cz - Az)
scoreboard players operation B ghef_calc = f ghef_calc
scoreboard players operation B ghef_calc *= b ghef_calc
# A = (Bz - Az)(Cx - Ax) - (Bx - Ax)(Cz - Az)
execute store result storage ghef:data temp.macro.y float 0.00001 run scoreboard players operation @s ghef_ny -= B ghef_calc

# A = (Bx - Ax)(Cy - Ay)
scoreboard players operation @s ghef_nz = f ghef_calc
scoreboard players operation @s ghef_nz *= d ghef_calc
# B = (By - Ay)(Cx - Ax)
scoreboard players operation B ghef_calc = a ghef_calc
scoreboard players operation B ghef_calc *= e ghef_calc
# A = (Bx - Ax)(Cy - Ay) - (By - Ay)(Cx - Ax)
execute store result storage ghef:data temp.macro.z float 0.00001 run scoreboard players operation @s ghef_nz -= B ghef_calc


# compute unit vector
function ghef:math/distance
execute store result score mag ghef_calc run data get storage ghef:data temp.distance 1

execute store result entity @s data.ghef.normal.x double 0.00001 run scoreboard players operation @s ghef_nx /= mag ghef_calc
execute store result entity @s data.ghef.normal.y double 0.00001 run scoreboard players operation @s ghef_ny /= mag ghef_calc
execute store result entity @s data.ghef.normal.z double 0.00001 run scoreboard players operation @s ghef_nz /= mag ghef_calc
execute at @s run function ghef:dev/zzz_helpers/set_collision/face_normal with entity @s data.ghef.normal


# clean up
data remove storage ghef:data temp

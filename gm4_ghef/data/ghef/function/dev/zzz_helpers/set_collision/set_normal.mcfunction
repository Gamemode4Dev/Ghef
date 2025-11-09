# @s = new collision marker
# located at player who ran the command
# run from ghef:dev/zzz_helpers/set_collision/new_collision


###
# (B - A) x (C - A)
# n_x = (By - Ay)(Cz - Az) - (Bz - Az)(Cy - Ay)
# n_y = (Bz - Az)(Cx - Ax) - (Bx - Ax)(Cz - Az)
# n_z = (Bx - Ax)(Cy - Ay) - (By - Ay)(Cx - Ax)
#
# A = corner 1, B = corner 3, C = corner 2
###

# a = By - Ay
scoreboard players operation a ghef_calc = @s ghef_By
scoreboard players operation a ghef_calc -= @s ghef_Ay
# b = Cz - Az
scoreboard players operation b ghef_calc = @s ghef_Cz
scoreboard players operation b ghef_calc -= @s ghef_Az
# c = Bz - Az
scoreboard players operation c ghef_calc = @s ghef_Bz
scoreboard players operation c ghef_calc -= @s ghef_Az
# d = Cy - Ay
scoreboard players operation d ghef_calc = @s ghef_Cy
scoreboard players operation d ghef_calc -= @s ghef_Ay
# e = Cx - Ax
scoreboard players operation e ghef_calc = @s ghef_Cx
scoreboard players operation e ghef_calc -= @s ghef_Ax
# f = Bx - Ax
scoreboard players operation f ghef_calc = @s ghef_Bx
scoreboard players operation f ghef_calc -= @s ghef_Ax


# nx = (By - Ay)(Cz - Az)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get a ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get b ghef_calc
function ghef:math/multiply
execute store result score @s ghef_nx run data get storage ghef:data temp.value 100000
# g = (Bz - Az)(Cy - Ay)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get c ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get d ghef_calc
function ghef:math/multiply
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
# nx = (By - Ay)(Cz - Az) - (Bz - Az)(Cy - Ay)
execute store result storage ghef:data temp.pos.x float 0.00001 run scoreboard players operation @s ghef_nx -= g ghef_calc

# ny = (Bz - Az)(Cx - Ax)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get c ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get e ghef_calc
function ghef:math/multiply
execute store result score @s ghef_ny run data get storage ghef:data temp.value 100000
# g = (Bx - Ax)(Cz - Az)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get f ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get b ghef_calc
function ghef:math/multiply
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
# ny = (Bz - Az)(Cx - Ax) - (Bx - Ax)(Cz - Az)
execute store result storage ghef:data temp.pos.y float 0.00001 run scoreboard players operation @s ghef_ny -= g ghef_calc

# nz = (Bx - Ax)(Cy - Ay)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get f ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get d ghef_calc
function ghef:math/multiply
execute store result score @s ghef_nz run data get storage ghef:data temp.value 100000
# g = (By - Ay)(Cx - Ax)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get a ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get e ghef_calc
function ghef:math/multiply
execute store result score g ghef_calc run data get storage ghef:data temp.value 100000
# nz = (Bx - Ax)(Cy - Ay) - (By - Ay)(Cx - Ax)
execute store result storage ghef:data temp.pos.z float 0.00001 run scoreboard players operation @s ghef_nz -= g ghef_calc


# compute unit vector
function ghef:math/distance
execute store result score mag ghef_calc run data get storage ghef:data temp.distance 1

execute store result entity @s data.ghef.normal.arr[0] double 0.00001 store result entity @s data.ghef.normal.x double 0.00001 run scoreboard players operation @s ghef_nx /= mag ghef_calc
execute store result entity @s data.ghef.normal.arr[1] double 0.00001 store result entity @s data.ghef.normal.y double 0.00001 run scoreboard players operation @s ghef_ny /= mag ghef_calc
execute store result entity @s data.ghef.normal.arr[2] double 0.00001 store result entity @s data.ghef.normal.z double 0.00001 run scoreboard players operation @s ghef_nz /= mag ghef_calc
execute at @s run function ghef:dev/zzz_helpers/set_collision/face_normal with entity @s data.ghef.normal

# store global unit vector coordinates
execute at @s positioned ^ ^ ^1 summon marker run function ghef:physics/util/get_coords
execute store result entity @s data.ghef.normal.X double 0.00001 store result score @s ghef_nX run data get storage ghef:data temp.Pos[0] 100000
execute store result entity @s data.ghef.normal.Y double 0.00001 store result score @s ghef_nY run data get storage ghef:data temp.Pos[1] 100000
execute store result entity @s data.ghef.normal.Z double 0.00001 store result score @s ghef_nZ run data get storage ghef:data temp.Pos[2] 100000

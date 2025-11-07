# @s = collision marker
# located at @s
# run from ghef:physics/plane/check_ball_collision
# run with storage ghef:data temp.pos (ball position + radius vector pointing at plane)

$execute facing $(x) $(y) $(z) positioned ^ ^ ^1 summon marker run function ghef:physics/util/get_coords
execute store result score x ghef_calc run data get storage ghef:data temp.Pos[0] 100000
execute store result score y ghef_calc run data get storage ghef:data temp.Pos[1] 100000
execute store result score z ghef_calc run data get storage ghef:data temp.Pos[2] 100000

# if sqrt(dx^2 + dy^2 + dz^2) > sqrt(2) then ball has passed the plane
execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation x ghef_calc -= @s ghef_nX
function ghef:math/multiply
execute store result score x ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation y ghef_calc -= @s ghef_nY
function ghef:math/multiply
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players operation z ghef_calc -= @s ghef_nZ
function ghef:math/multiply
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x ghef_calc += y ghef_calc
scoreboard players operation x ghef_calc += z ghef_calc

# execute if score x ghef_calc matches 200000.. run say @e[type=marker,tag=ghef_check,limit=1] collided with @s
# execute if score x ghef_calc matches 200000.. run particle flame ~ ~ ~ 0 0 0 0 1
execute if score x ghef_calc matches 200000.. run return 1
return 0

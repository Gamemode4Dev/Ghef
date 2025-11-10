# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/ball/check_plane_collision
# run with entity <ghef ball marker> data.ghef

# check is ball intersects (infinite) plane
#    shortest distance <dist> = dot(point on plane <M> - center of ball <ball_>, normal unit vector of plane <N>)
scoreboard players operation plane_x ghef_calc = @s ghef_x
scoreboard players operation plane_y ghef_calc = @s ghef_y
scoreboard players operation plane_z ghef_calc = @s ghef_z

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation plane_x ghef_calc -= ball_x ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score dist ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation plane_y ghef_calc -= ball_y ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players operation plane_z ghef_calc -= ball_z ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation dist ghef_calc += y ghef_calc
scoreboard players operation dist ghef_calc += z ghef_calc

#    check if distance from center of ball to closest point on plane <dist> is less than radius of ball
execute if score dist ghef_calc > radius ghef_calc run return fail
scoreboard players operation radius ghef_calc *= #-1 ghef_data
execute if score dist ghef_calc < radius ghef_calc run return run scoreboard players operation radius ghef_calc *= #-1 ghef_data


# check if projected center point is within bounds
scoreboard players operation dist ghef_calc *= #-1 ghef_data
scoreboard players operation radius ghef_calc *= #-1 ghef_data

#    projected point <A (overwrite)> = center of ball <A> - (normal <N> * shortest distance <dist>) (vector math)
execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get dist ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nx
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score P ghef_calc run data get storage ghef:data temp.value 100000
scoreboard players operation Px ghef_calc = ball_x ghef_calc
scoreboard players operation Px ghef_calc -= P ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get dist ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_ny
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score P ghef_calc run data get storage ghef:data temp.value 100000
scoreboard players operation Py ghef_calc = ball_y ghef_calc
scoreboard players operation Py ghef_calc -= P ghef_calc

execute store result storage ghef:data temp.mul.a double 0.00001 run scoreboard players get dist ghef_calc
execute store result storage ghef:data temp.mul.b double 0.00001 run scoreboard players get @s ghef_nz
execute summon item_display run function ghef:math/zzz_helpers/multiply/calculate with storage ghef:data temp.mul
execute store result score P ghef_calc run data get storage ghef:data temp.value 100000
scoreboard players operation Pz ghef_calc = ball_z ghef_calc
scoreboard players operation Pz ghef_calc -= P ghef_calc

#    calculate cross products (annotated using corners A B C, point P) and dot product with normal vector
#    (P - A) x (C - A) • N => (APxAC)•N
function ghef:physics/plane/check_ball_collision/check_points/ac
#    (P - C) x (B - C) • N => (CPxCB)•N
function ghef:physics/plane/check_ball_collision/check_points/cb
#    (P - B) x (A - B) • N => (BPxBA)•N
function ghef:physics/plane/check_ball_collision/check_points/ba

#    check if all 3 have the same sign
scoreboard players set inside ghef_calc 0
execute if score ac ghef_calc matches 0.. if score cb ghef_calc matches 0.. if score ba ghef_calc matches 0.. run scoreboard players set inside ghef_calc 1
execute if score ac ghef_calc matches ..0 if score cb ghef_calc matches ..0 if score ba ghef_calc matches ..0 run scoreboard players set inside ghef_calc 1

#    calculate and check segments for parallelogram surface
execute unless entity @s[tag=ghef_collision_triangle] run function ghef:physics/plane/check_ball_collision/parallelogram/center_projection

# if projected center is not inside, check distance to each line segment
execute if score inside ghef_calc matches 0 run function ghef:physics/plane/check_ball_collision/check_line_segments
execute if score inside ghef_calc matches 0 run return fail


# finally, we know that the ball is intersecting the plane
execute if score markers ghef_data matches 1 at @s run particle flame ~ ~ ~ 0 0 0 0 1
tag @s add ghef_colliding

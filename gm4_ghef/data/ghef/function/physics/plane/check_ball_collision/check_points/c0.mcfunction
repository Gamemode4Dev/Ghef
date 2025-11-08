# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner A, corner B - corner A)

# set up terms
#    a = Py - Ay
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_y1
#    b = Bz - Az
scoreboard players operation b ghef_calc = @s ghef_z2
scoreboard players operation b ghef_calc -= @s ghef_z1
#    c = Pz - Az
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_z1
#    d = By - Ay
scoreboard players operation d ghef_calc = @s ghef_y2
scoreboard players operation d ghef_calc -= @s ghef_y1
#    e = Bx - Ax
scoreboard players operation e ghef_calc = @s ghef_x2
scoreboard players operation e ghef_calc -= @s ghef_x1
#    f = Px - Ax
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_x1

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score c0 ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

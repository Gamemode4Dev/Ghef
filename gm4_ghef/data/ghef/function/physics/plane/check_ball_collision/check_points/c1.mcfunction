# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner B, corner C - corner B) 

# set up terms
#    a = Py - By
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_y2
#    b = Cz - Bz
scoreboard players operation b ghef_calc = @s ghef_z3
scoreboard players operation b ghef_calc -= @s ghef_z2
#    c = Pz - Bz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_z2
#    d = Cy - By
scoreboard players operation d ghef_calc = @s ghef_y3
scoreboard players operation d ghef_calc -= @s ghef_y2
#    e = Cx - Bx
scoreboard players operation e ghef_calc = @s ghef_x3
scoreboard players operation e ghef_calc -= @s ghef_x2
#    f = Px - Bx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_x2

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score c1 ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

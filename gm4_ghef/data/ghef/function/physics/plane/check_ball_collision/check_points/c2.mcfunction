# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner C, corner A - corner C) 

# set up terms
#    a = Py - Cy
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_y3
#    b = Az - Cz
scoreboard players operation b ghef_calc = @s ghef_z1
scoreboard players operation b ghef_calc -= @s ghef_z3
#    c = Pz - Cz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_z3
#    d = Ay - Cy
scoreboard players operation d ghef_calc = @s ghef_y1
scoreboard players operation d ghef_calc -= @s ghef_y3
#    e = Ax - Cx
scoreboard players operation e ghef_calc = @s ghef_x1
scoreboard players operation e ghef_calc -= @s ghef_x3
#    f = Px - Cx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_x3

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score c2 ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

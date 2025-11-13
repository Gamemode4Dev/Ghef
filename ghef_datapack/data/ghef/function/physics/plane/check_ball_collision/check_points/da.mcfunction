# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision/parallelogram/center_projection

# cross(projected center - corner D, corner A - corner D) 

# set up terms
#    a = Py - Dy
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_Dy
#    b = Az - Dz
scoreboard players operation b ghef_calc = @s ghef_Az
scoreboard players operation b ghef_calc -= @s ghef_Dz
#    c = Pz - Dz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_Dz
#    d = Ay - Dy
scoreboard players operation d ghef_calc = @s ghef_Ay
scoreboard players operation d ghef_calc -= @s ghef_Dy
#    e = Ax - Dx
scoreboard players operation e ghef_calc = @s ghef_Ax
scoreboard players operation e ghef_calc -= @s ghef_Dx
#    f = Px - Dx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_Dx

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score da ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

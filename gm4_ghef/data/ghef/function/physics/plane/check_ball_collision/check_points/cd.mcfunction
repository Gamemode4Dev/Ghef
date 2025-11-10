# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision/parallelogram/center_projection

# cross(projected center - corner C, corner D - corner C) 

# set up terms
#    a = Py - Cy
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_Cy
#    b = Dz - Cz
scoreboard players operation b ghef_calc = @s ghef_Dz
scoreboard players operation b ghef_calc -= @s ghef_Cz
#    c = Pz - Cz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_Cz
#    d = Dy - Cy
scoreboard players operation d ghef_calc = @s ghef_Dy
scoreboard players operation d ghef_calc -= @s ghef_Cy
#    e = Dx - Cx
scoreboard players operation e ghef_calc = @s ghef_Dx
scoreboard players operation e ghef_calc -= @s ghef_Cx
#    f = Px - Cx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_Cx

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score cd ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner C, corner B - corner C) 

# set up terms
#    a = Py - Cy
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_Cy
#    b = Bz - Cz
scoreboard players operation b ghef_calc = @s ghef_Bz
scoreboard players operation b ghef_calc -= @s ghef_Cz
#    c = Pz - Cz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_Cz
#    d = By - Cy
scoreboard players operation d ghef_calc = @s ghef_By
scoreboard players operation d ghef_calc -= @s ghef_Cy
#    e = Bx - Cx
scoreboard players operation e ghef_calc = @s ghef_Bx
scoreboard players operation e ghef_calc -= @s ghef_Cx
#    f = Px - Cx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_Cx

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score c1 ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

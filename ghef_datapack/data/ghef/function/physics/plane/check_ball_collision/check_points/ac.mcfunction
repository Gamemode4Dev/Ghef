# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner A, corner C - corner A)

# set up terms
#    a = Py - Ay
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_Ay
#    b = Cz - Az
scoreboard players operation b ghef_calc = @s ghef_Cz
scoreboard players operation b ghef_calc -= @s ghef_Az
#    c = Pz - Az
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_Az
#    d = Cy - Ay
scoreboard players operation d ghef_calc = @s ghef_Cy
scoreboard players operation d ghef_calc -= @s ghef_Ay
#    e = Cx - Ax
scoreboard players operation e ghef_calc = @s ghef_Cx
scoreboard players operation e ghef_calc -= @s ghef_Ax
#    f = Px - Ax
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_Ax

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score ac ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

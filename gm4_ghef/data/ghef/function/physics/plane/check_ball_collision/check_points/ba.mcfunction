# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# cross(projected center - corner B, corner A - corner B) 

# set up terms
#    a = Py - By
scoreboard players operation a ghef_calc = Py ghef_calc
scoreboard players operation a ghef_calc -= @s ghef_By
#    b = Az - Bz
scoreboard players operation b ghef_calc = @s ghef_Az
scoreboard players operation b ghef_calc -= @s ghef_Bz
#    c = Pz - Bz
scoreboard players operation c ghef_calc = Pz ghef_calc
scoreboard players operation c ghef_calc -= @s ghef_Bz
#    d = Ay - By
scoreboard players operation d ghef_calc = @s ghef_Ay
scoreboard players operation d ghef_calc -= @s ghef_By
#    e = Ax - Bx
scoreboard players operation e ghef_calc = @s ghef_Ax
scoreboard players operation e ghef_calc -= @s ghef_Bx
#    f = Px - Bx
scoreboard players operation f ghef_calc = Px ghef_calc
scoreboard players operation f ghef_calc -= @s ghef_Bx

# calculate cross product (Vx,Vy,Vz) and dot product dot(V,normal)
execute store result score ba ghef_calc run function ghef:physics/plane/check_ball_collision/check_points/cross_and_dot

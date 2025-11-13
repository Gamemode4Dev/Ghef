# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# vector
scoreboard players operation @s ghef_px = @s ghef_nx
scoreboard players operation @s ghef_py = @s ghef_ny
scoreboard players operation @s ghef_pz = @s ghef_nz

# depth
scoreboard players operation I ghef_calc = dist ghef_calc
execute if score I ghef_calc matches ..0 run scoreboard players operation I ghef_calc *= #-1 ghef_data
scoreboard players operation @s ghef_p = radius ghef_calc
scoreboard players operation @s ghef_p -= I ghef_calc

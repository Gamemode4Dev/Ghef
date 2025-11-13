# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/plane/check_ball_collision

# (P - C) x (D - C) • N => (CPxCD)•N
function ghef:physics/plane/check_ball_collision/check_points/cd
# (P - D) x (A - D) • N => (DPxDA)•N
function ghef:physics/plane/check_ball_collision/check_points/da

# check if all 3 have the same sign (including ac which was already calculated)
execute if score ac ghef_calc matches 0.. if score cd ghef_calc matches 0.. if score da ghef_calc matches 0.. run scoreboard players set inside ghef_calc 1
execute if score ac ghef_calc matches ..0 if score cd ghef_calc matches ..0 if score da ghef_calc matches ..0 run scoreboard players set inside ghef_calc 1

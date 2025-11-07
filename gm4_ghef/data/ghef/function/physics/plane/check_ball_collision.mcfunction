# @s = ghef collision plane
# located at ghef ball marker
# run from ghef:physics/ball/check_plane_collision
# run with entity <ghef ball marker> data.ghef

$execute rotated as @s positioned ^ ^ ^-$(radius) summon marker run function ghef:physics/util/get_coords
data modify storage ghef:data temp.pos.x set from storage ghef:data temp.Pos[0]
data modify storage ghef:data temp.pos.y set from storage ghef:data temp.Pos[1]
data modify storage ghef:data temp.pos.z set from storage ghef:data temp.Pos[2]
execute store result score collision ghef_data at @s run function ghef:physics/plane/check_facing with storage ghef:data temp.pos
execute if score collision ghef_data matches 0 run return 0

$execute rotated as @s positioned ^ ^ ^$(radius) summon marker run function ghef:physics/util/get_coords
data modify storage ghef:data temp.pos.x set from storage ghef:data temp.Pos[0]
data modify storage ghef:data temp.pos.y set from storage ghef:data temp.Pos[1]
data modify storage ghef:data temp.pos.z set from storage ghef:data temp.Pos[2]
execute store result score collision ghef_data at @s run function ghef:physics/plane/check_facing with storage ghef:data temp.pos
execute if score collision ghef_data matches 1 run return 0

execute at @s run particle flame ~ ~ ~ 0 0 0 0 1
return run tag @s add ghef_colliding

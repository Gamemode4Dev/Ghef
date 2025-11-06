# @s = collision marker
# located at @s
# run from ghef:debug/setup
# run with with storage ghef:data temp.macro

particle minecraft:dust{color:[0.1, 0.2, 1], scale:1} ~ ~ ~ 0 0 0 0 1
particle minecraft:dust{color:[0.3, 0.7, 1], scale:0.3} ^ ^ ^0.1 0 0 0 0 1
particle minecraft:dust{color:[0.3, 0.7, 1], scale:0.3} ^ ^ ^0.2 0 0 0 0 1
particle minecraft:dust{color:[0.3, 0.7, 1], scale:0.3} ^ ^ ^0.3 0 0 0 0 1
particle minecraft:dust{color:[0.3, 0.7, 1], scale:0.3} ^ ^ ^0.4 0 0 0 0 1
particle minecraft:dust{color:[0.3, 0.7, 1], scale:0.3} ^ ^ ^0.5 0 0 0 0 1
$execute positioned $(Ax) $(Ay) $(Az) facing entity @s feet run function ghef:debug/collision_markers/ray
$execute positioned $(Bx) $(By) $(Bz) facing entity @s feet run function ghef:debug/collision_markers/ray
$execute positioned $(Cx) $(Cy) $(Cz) facing entity @s feet run function ghef:debug/collision_markers/ray
$execute positioned $(Dx) $(Dy) $(Dz) facing entity @s feet run function ghef:debug/collision_markers/ray

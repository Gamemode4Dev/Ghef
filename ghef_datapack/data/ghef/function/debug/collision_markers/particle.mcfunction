# @s = collision marker
# located at @s
# run from ghef:debug/setup
# run with with storage ghef:data temp.corners

function ghef:debug/collision_markers/particle_triangle with storage ghef:data temp.corners
$execute positioned $(Dx) $(Dy) $(Dz) facing entity @s feet run function ghef:debug/collision_markers/ray

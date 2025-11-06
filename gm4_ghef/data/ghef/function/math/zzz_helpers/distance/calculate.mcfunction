# @s = new item display
# located at @s
# run from ghef:math/distance
# run with storage ghef:data temp.macro

$data merge entity @s {view_range:0f,transformation:[$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]}
data modify storage ghef:data temp.distance set from entity @s transformation.scale[0]
kill @s

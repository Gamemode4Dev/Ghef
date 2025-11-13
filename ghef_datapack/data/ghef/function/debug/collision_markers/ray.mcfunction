# @s = collision marker
# located at each corner, positioned towards center (@s)
# run from self
#      and ghef:debug/collision_markers/particle

particle minecraft:dust{color:[0.2, 0.4, 1], scale:0.75} ~ ~ ~ 0 0 0 0 1
execute unless entity @s[distance=..1.5] positioned ^ ^ ^1 run function ghef:debug/collision_markers/ray

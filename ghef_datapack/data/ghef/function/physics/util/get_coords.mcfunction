# @s = new temp marker
# located at @s (usually 1 block in front of a point of interest)
# run from ghef:physics/plane/check_facing
#      and ghef:physics/plane/check_ball_collision
#      and ghef:dev/zzz_helpers/set_collision/set_normal
#      and ghef:dev/zzz_helpers/flip_collision

data modify storage ghef:data temp.Pos set from entity @s Pos
kill @s

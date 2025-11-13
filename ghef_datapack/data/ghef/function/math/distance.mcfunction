# input storage ghef:data temp.pos.x temp.pos.y temp.pos.z
# returns sqrt(x^2 + y^2 + z^2) in storage ghef:data temp.distance

execute summon item_display run function ghef:math/zzz_helpers/distance/calculate with storage ghef:data temp.pos

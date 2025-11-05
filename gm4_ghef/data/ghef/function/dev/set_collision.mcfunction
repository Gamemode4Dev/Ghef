execute unless entity @e[type=area_effect_cloud,tag=ghef_pos_1,distance=..50] run return run tellraw @s [{"text":"Use ","color":"red"},{"text":"/function ghef:dev/pos1","color":gray},{"text":" to set corner 1","color":"red"}]
execute unless entity @e[type=area_effect_cloud,tag=ghef_pos_2,distance=..50] run return run tellraw @s [{"text":"Use ","color":"red"},{"text":"/function ghef:dev/pos2","color":gray},{"text":" to set corner 2","color":"red"}]

# if corner 3 doesn't exist, assume a flat plane
execute unless entity @e[type=area_effect_cloud,tag=ghef_pos_3,distance=..50] summon area_effect_cloud run function ghef:dev/zzz_helpers/set_collision/infer_pos3

# create collision plane
execute summon marker run function ghef:dev/zzz_helpers/set_collision/new_collision

# clean up
kill @e[type=area_effect_cloud,tag=ghef_pos,distance=..50]
data remove storage ghef:data temp

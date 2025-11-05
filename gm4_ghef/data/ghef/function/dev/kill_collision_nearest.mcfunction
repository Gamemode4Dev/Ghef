execute as @n[type=marker,tag=ghef_collision,distance=..50] run scoreboard players operation curr ghef_col_id = @s ghef_col_id
kill @e[type=marker,tag=ghef_collision,distance=..50,predicate=ghef:match_col_id,limit=2]

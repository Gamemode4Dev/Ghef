execute if score debug_y ghef_data matches 1 run tellraw @a {text:"HIT FLOOR",color:"yellow"}
# check if the ball should stop
scoreboard players operation check_y ghef_calc = @s ghef_vy
scoreboard players operation check_y ghef_calc -= @s ghef_gravity
scoreboard players operation check_y ghef_calc -= @s ghef_gravity
execute unless score check_y ghef_calc matches ..500 run return fail
execute if score debug_y ghef_data matches 1 run tellraw @a {text:"ON FLOOR",color:"green"}

# snap ball to floor
scoreboard players set @s ghef_vy 0
tag @s add ghef_on_ground
scoreboard players operation @s ghef_y = floor_y ghef_calc
scoreboard players operation @s ghef_y += @s ghef_radius
execute store result entity @s Pos[1] double 0.00001 run scoreboard players add @s ghef_y 1

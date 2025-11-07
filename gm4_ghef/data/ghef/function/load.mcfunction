tellraw @a {"text":"Ghef datapack loaded","color":"green"}

# temporary calculations
scoreboard objectives add ghef_calc dummy
# semi-permanent data
scoreboard objectives add ghef_data dummy

# physics objects
scoreboard objectives add ghef_level_id dummy
scoreboard objectives add ghef_radius dummy

# positions
scoreboard objectives add ghef_x dummy
scoreboard objectives add ghef_y dummy
scoreboard objectives add ghef_z dummy

scoreboard objectives add ghef_x1 dummy
scoreboard objectives add ghef_y1 dummy
scoreboard objectives add ghef_z1 dummy

scoreboard objectives add ghef_x2 dummy
scoreboard objectives add ghef_y2 dummy
scoreboard objectives add ghef_z2 dummy

scoreboard objectives add ghef_x3 dummy
scoreboard objectives add ghef_y3 dummy
scoreboard objectives add ghef_z3 dummy

scoreboard objectives add ghef_x4 dummy
scoreboard objectives add ghef_y4 dummy
scoreboard objectives add ghef_z4 dummy

# normal vector
scoreboard objectives add ghef_nx dummy
scoreboard objectives add ghef_ny dummy
scoreboard objectives add ghef_nz dummy

# normal unit vector global location
scoreboard objectives add ghef_nX dummy
scoreboard objectives add ghef_nY dummy
scoreboard objectives add ghef_nZ dummy

# velocity
scoreboard objectives add ghef_vx dummy
scoreboard objectives add ghef_vy dummy
scoreboard objectives add ghef_vz dummy

# constants
function ghef:setup/const

# clocks
schedule function ghef:setup/tick_ball 1

#declare storage ghef:data

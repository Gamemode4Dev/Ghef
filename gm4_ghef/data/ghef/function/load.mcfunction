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

scoreboard objectives add ghef_Ax dummy
scoreboard objectives add ghef_Ay dummy
scoreboard objectives add ghef_Az dummy

scoreboard objectives add ghef_Bx dummy
scoreboard objectives add ghef_By dummy
scoreboard objectives add ghef_Bz dummy

scoreboard objectives add ghef_Cx dummy
scoreboard objectives add ghef_Cy dummy
scoreboard objectives add ghef_Cz dummy

scoreboard objectives add ghef_Dx dummy
scoreboard objectives add ghef_Dy dummy
scoreboard objectives add ghef_Dz dummy

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

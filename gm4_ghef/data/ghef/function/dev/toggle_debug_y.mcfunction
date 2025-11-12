# toggles Y and VY velocity checks


execute unless score debug_y ghef_data matches 1 store success score debug_y ghef_data run return 1
scoreboard players set debug_y ghef_data 0

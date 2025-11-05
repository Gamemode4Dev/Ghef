# toggles debug markers


execute unless score markers ghef_data matches 1 store success score markers ghef_data run return run schedule function ghef:debug/markers 1
schedule clear ghef:debug/markers
scoreboard players set markers ghef_data 0

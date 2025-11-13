# input storage ghef:data temp.v1[x,y,z] temp.v2[x,y,z]
# returns dot product of 2 vectors

# AxBx + AyBy + AzBz
data modify storage ghef:data temp.mul.a set from storage ghef:data temp.v1[0]
data modify storage ghef:data temp.mul.b set from storage ghef:data temp.v2[0]
function ghef:math/multiply
execute store result score x ghef_calc run data get storage ghef:data temp.value 100000
data modify storage ghef:data temp.mul.a set from storage ghef:data temp.v1[1]
data modify storage ghef:data temp.mul.b set from storage ghef:data temp.v2[1]
function ghef:math/multiply
execute store result score y ghef_calc run data get storage ghef:data temp.value 100000
data modify storage ghef:data temp.mul.a set from storage ghef:data temp.v1[2]
data modify storage ghef:data temp.mul.b set from storage ghef:data temp.v2[2]
function ghef:math/multiply
execute store result score z ghef_calc run data get storage ghef:data temp.value 100000

scoreboard players operation x ghef_calc += y ghef_calc
scoreboard players operation x ghef_calc += z ghef_calc

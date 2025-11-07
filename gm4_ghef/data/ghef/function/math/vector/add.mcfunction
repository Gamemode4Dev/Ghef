# input ghef:data temp.v1[x,y,z] and temp.v2[Bx,By,Bz]
# returns v1 + v2 in ghef:data temp.v

execute store result score Ax ghef_calc run data get storage ghef:data temp.pos1[0] 100000
execute store result score Ay ghef_calc run data get storage ghef:data temp.pos1[1] 100000
execute store result score Az ghef_calc run data get storage ghef:data temp.pos1[2] 100000

execute store result score Bx ghef_calc run data get storage ghef:data temp.pos2[0] 100000
execute store result score By ghef_calc run data get storage ghef:data temp.pos2[1] 100000
execute store result score Bz ghef_calc run data get storage ghef:data temp.pos2[2] 100000

data merge storage ghef:data {temp:{v:[0.0,0.0,0.0]}}
execute store result storage ghef:data temp.v[0] double 0.00001 run scoreboard players operation Ax ghef_calc += Bx ghef_calc
execute store result storage ghef:data temp.v[1] double 0.00001 run scoreboard players operation Ay ghef_calc += By ghef_calc
execute store result storage ghef:data temp.v[2] double 0.00001 run scoreboard players operation Az ghef_calc += Bz ghef_calc

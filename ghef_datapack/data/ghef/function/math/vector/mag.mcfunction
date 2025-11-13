# input ghef:data temp.v[x,y,z]
# returns magnitude in ghef:data temp.value

data modify storage ghef:data temp.pos.x set from storage ghef:data temp.v[0]
data modify storage ghef:data temp.pos.y set from storage ghef:data temp.v[1]
data modify storage ghef:data temp.pos.z set from storage ghef:data temp.v[2]
function ghef:math/distance
data modify storage ghef:data temp.value set from storage ghef:data temp.distance




$data modify storage ghef:data temp.var set value [0f,0f,0f,$(a)f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]
$data modify entity @s transformation set value [0f,0f,0f,1f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,$(b)f]
data modify storage ghef:data temp.var[-1] set from entity @s transformation.translation[0]
data modify entity @s transformation set from storage ghef:data temp.var
data modify storage ghef:data temp.value set from entity @s transformation.translation[0]
data remove storage ghef:data temp.var
kill @s

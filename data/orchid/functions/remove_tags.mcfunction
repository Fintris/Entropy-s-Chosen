tag @s remove forward
tag @s remove backwards
tag @s remove left
tag @s remove right
tag @s remove jump
tag @s remove crouch

execute if entity @s[tag=!primary] run tag @s remove used_primary
tag @s remove primary

execute if entity @s[tag=!secondary] run tag @s remove used_secondary
tag @s remove secondary


tag @s remove hit

tag @s remove ok
execute if entity @s[tag=teleported2] run effect clear @s slow_falling
execute if entity @s[tag=teleported2] run tag @s remove teleported2
execute if entity @s[tag=teleported] run tag @s add teleported2
execute if entity @s[tag=teleported] run tag @s remove teleported


tag @s add teleporter


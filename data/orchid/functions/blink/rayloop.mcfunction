#e
## remove 
scoreboard players remove @s fintris.distance 1

## block detection
execute if score @s fintris.distance matches 1 run tp @e[tag=yoink] ~ ~0.5 ~

execute unless block ^ ^ ^ #orchid:teleporter run function orchid:blink/teleport

## hitbox detection
execute as @e[dx=0,tag=!self] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run function orchid:blink/teleportentity
## loop
execute if score @s fintris.distance matches 1.. positioned ^ ^ ^0.25 run function orchid:blink/rayloop

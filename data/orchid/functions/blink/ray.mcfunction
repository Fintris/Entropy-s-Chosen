tag @s add self
execute at @s run tag @s add yoink
scoreboard objectives add fintris.distance dummy
scoreboard players set @s fintris.distance 60

execute at @s anchored eyes rotated as @s run function orchid:blink/rayloop

tag @e remove yoink
tag @s remove self
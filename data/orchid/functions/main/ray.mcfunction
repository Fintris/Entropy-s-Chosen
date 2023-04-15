tag @s add self
execute at @s run tag @s add yoink
scoreboard objectives add fintris.distance dummy
scoreboard players set @s fintris.distance 400

execute at @s anchored eyes rotated as @s run function orchid:main/rayloop

tag @e remove yoink
tag @s remove self
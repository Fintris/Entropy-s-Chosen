# Function by TheViralMelon#3716, who would much prefer to remain unassociated to this atrocity thank you very much

execute store result score @s fintris.compareUUID.0 run data get entity @s UUID[0]
execute store result score @s fintris.compareUUID.1 run data get entity @s UUID[1]
execute store result score @s fintris.compareUUID.2 run data get entity @s UUID[2]
execute store result score @s fintris.compareUUID.3 run data get entity @s UUID[3]

execute if score @s fintris.compareUUID.0 = @e[tag=deflectSpawn,limit=1] fintris.compareUUID.0 if score @s fintris.compareUUID.1 = @e[tag=deflectSpawn,limit=1] fintris.compareUUID.1 if score @s fintris.compareUUID.2 = @e[tag=deflectSpawn,limit=1] fintris.compareUUID.2 if score @s fintris.compareUUID.3 = @e[tag=deflectSpawn,limit=1] fintris.compareUUID.3 run tag @s add deflectTarget

scoreboard players reset @s fintris.compareUUID.0
scoreboard players reset @s fintris.compareUUID.1
scoreboard players reset @s fintris.compareUUID.2
scoreboard players reset @s fintris.compareUUID.3
# Function by TheViralMelon#3716
tag @s add deflected
tag @s add deflectSpawn

execute store result score @s fintris.compareUUID.0 run data get entity @s Owner[0]
execute store result score @s fintris.compareUUID.1 run data get entity @s Owner[1]
execute store result score @s fintris.compareUUID.2 run data get entity @s Owner[2]
execute store result score @s fintris.compareUUID.3 run data get entity @s Owner[3]

execute as @e[type=!arrow,type=!marker,type=!armor_stand,type=!area_effect_cloud] run function orchid:fintris/shotme

scoreboard players reset @s fintris.compareUUID.0
scoreboard players reset @s fintris.compareUUID.1
scoreboard players reset @s fintris.compareUUID.2
scoreboard players reset @s fintris.compareUUID.3

execute if entity @e[tag=deflectTarget] run data merge entity @s {crit:1b,LeftOwner:1b}


execute facing entity @e[tag=deflectTarget] eyes positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:[deflectSpawn]}
execute as @e[tag=deflectSpawn] store result score @s fintris.compareUUID.0 run data get entity @s Pos[0] 1000
execute as @e[tag=deflectSpawn] store result score @s fintris.compareUUID.1 run data get entity @s Pos[1] 1000
execute as @e[tag=deflectSpawn] store result score @s fintris.compareUUID.2 run data get entity @s Pos[2] 1000
scoreboard players operation @s fintris.compareUUID.0 -= @e[tag=deflectSpawn,type=marker] fintris.compareUUID.0
scoreboard players operation @s fintris.compareUUID.1 -= @e[tag=deflectSpawn,type=marker] fintris.compareUUID.1
scoreboard players operation @s fintris.compareUUID.2 -= @e[tag=deflectSpawn,type=marker] fintris.compareUUID.2
kill @e[tag=deflectSpawn,type=marker]

execute store result entity @s Motion[0] double -0.0035 run scoreboard players get @s fintris.compareUUID.0
execute store result entity @s Motion[1] double -0.0035 run scoreboard players get @s fintris.compareUUID.1
execute store result entity @s Motion[2] double -0.0035 run scoreboard players get @s fintris.compareUUID.2

execute unless entity @e[tag=deflectTarget] store result entity @s Motion[0] double -0.0001 run data get entity @s Motion[0] 10000
execute unless entity @e[tag=deflectTarget] store result entity @s Motion[1] double -0.0001 run data get entity @s Motion[1] 10000
execute unless entity @e[tag=deflectTarget] store result entity @s Motion[2] double -0.0001 run data get entity @s Motion[2] 10000

data modify entity @s Owner set from entity @a[tag=noCooldown,limit=1] UUID

tag @e[tag=deflectTarget] remove deflectTarget
tag @s remove deflectSpawn
execute store success score @s fintris.compareUUID.0 run gamerule showDeathMessages false
execute as @s[scores={fintris.compareUUID.0=1..}] run tellraw @a [{"selector":"@a[tag=ecdeathtag]","italic":false}, {"text":" was sliced in half by "}, {"selector":"@s","italic":false}]
execute if entity @s[scores={fintris.compareUUID.0=1..}] run gamerule showDeathMessages true
scoreboard players set @s fintris.compareUUID.0 0
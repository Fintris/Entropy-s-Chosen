execute store success score @s fintris.compareUUID.0 run gamerule showDeathMessages false
execute as @s[scores={fintris.compareUUID.0=1..}] run tellraw @a [{"selector":"@a[tag=ecdeathtag]","italic":false}, {"text":"%s couldn't bare the raw energy of "}, {"selector":"@s","italic":false}, {"text":"'s blade."}]
execute if entity @s[scores={fintris.compareUUID.0=1..}] run gamerule showDeathMessages true
scoreboard players set @s fintris.compareUUID.0 0
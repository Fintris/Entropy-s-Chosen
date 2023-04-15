summon minecraft:marker ~ ~ ~ {Tags:["entropy.swapMarker"]}
teleport @s @e[limit=1,tag=attacker,sort=nearest]
teleport @e[limit=1,tag=attacker,sort=nearest] @e[type=minecraft:marker,tag=entropy.swapMarker,limit=1,sort=nearest]
kill @e[type=minecraft:marker,tag=entropy.swapMarker,limit=1,sort=nearest]
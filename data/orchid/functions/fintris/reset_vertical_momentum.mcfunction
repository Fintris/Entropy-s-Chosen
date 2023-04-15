# Mark current coordinates with marker
summon minecraft:marker ~ ~ ~ {Tags:["ec.FixVerticalCoordinates"]}
# Reset momentum by teleporting to fixed area
teleport ~ 100 ~
# Teleport back to old coordinates
execute positioned as @e[type=minecraft:marker,tag=ec.FixVerticalCoordinates,limit=1] run tp @s ~ ~ ~
# Kill marker marking old coordinates
kill @e[type=marker,tag=ec.FixVerticalCoordinates,limit=1,sort=nearest]
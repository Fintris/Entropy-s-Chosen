# teleport behind entity
execute unless block ~ ~ ~ #orchid:nonsolid if block ~ ~1 ~ #orchid:nonsolid if block ~ ~2 ~ #orchid:nonsolid at @s rotated as @s rotated ~ 0 positioned ^ ^ ^-2 run tp @e[tag=yoink] ~ ~ ~ facing entity @s

# teleport too entity
execute unless block ~ ~ ~ #orchid:nonsolid if block ~ ~1 ~ #orchid:nonsolid if block ~ ~2 ~ #orchid:nonsolid run tag @a[tag=self] add or
execute unless entity @a[tag=self,tag=or] at @s run tp @e[tag=yoink] ~ ~ ~
tag @a[tag=self,tag=or] remove or

# end
scoreboard players set @a[tag=self] fintris.distance 0
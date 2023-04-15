execute if block ~ ~1 ~ #orchid:nonsolid if block ~ ~2 ~ #orchid:nonsolid align xyz positioned ~0.5 ~1 ~0.5 run tp @e[tag=yoink] ~ ~ ~

# side tp
execute if block ~ ~1 ~ #orchid:nonsolid if block ~ ~2 ~ #orchid:nonsolid run tag @a[tag=self] add or
execute unless entity @a[tag=self,tag=or] facing entity @a[tag=self] eyes run tp @e[tag=yoink] ^ ^ ^1
tag @a[tag=self] remove or

# stop
scoreboard players set @a[tag=self] fintris.distance 0
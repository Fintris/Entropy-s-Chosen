#> Credits go to ExpertCoder of r/MinecraftCommands for this function
scoreboard players operation @s fintris.UUID2 = #val1 fintris.dummy1
scoreboard players operation @s fintris.UUID2 += #val2 fintris.dummy1
scoreboard players operation @s fintris.UUID2 *= @s fintris.UUID2

execute if score @s fintris.UUID2 <= @s fintris.UUID0 run scoreboard players operation #val1 fintris.dummy1 += #val2 fintris.dummy1

scoreboard players operation #val2 fintris.dummy1 /= 2 fintris.mana
execute if score #val2 fintris.dummy1 matches 1.. run function orchid:square_root
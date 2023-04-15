# Credits go to ExpertCoder of r/MinecraftCommands for this function
scoreboard players operation @s fused.UUID2 = @s fused.dummy1
scoreboard players operation @s fused.UUID2 += @s fused.dummy2
scoreboard players operation @s fused.UUID2 *= @s fused.UUID2

execute if score @s fused.UUID2 <= @s fused.UUID0 run scoreboard players operation @s fused.dummy1 += @s fused.dummy2

scoreboard players operation @s fused.dummy2 /= 2 fused.mana
execute if score @s fused.dummy2 matches 1.. run function fused:square_root
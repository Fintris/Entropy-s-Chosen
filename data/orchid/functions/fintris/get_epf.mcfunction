execute store result score #epfFeet fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:100b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfLegs fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:101b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfChest fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:102b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfHead fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:103b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfFeet fintris.dummy1 run data get entity @s[type=!player] ArmorItems[0].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfLegs fintris.dummy1 run data get entity @s[type=!player] ArmorItems[1].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfChest fintris.dummy1 run data get entity @s[type=!player] ArmorItems[2].tag.Enchantments[{id:"minecraft:protection"}].lvl

scoreboard players operation #epfCalc fintris.dummy1 += #epfFeet fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfLegs fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfChest fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfHead fintris.dummy1

scoreboard players reset #epfFeet fintris.dummy1
scoreboard players reset #epfLegs fintris.dummy1
scoreboard players reset #epfChest fintris.dummy1
scoreboard players reset #epfHead fintris.dummy1
scoreboard players reset #epfCalc fintris.dummy1

resource operation @s orchid:fintris/none_epf = #epfCalc fintris.dummy1
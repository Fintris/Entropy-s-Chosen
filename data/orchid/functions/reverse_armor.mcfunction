#> base damage from total damage ... if we let r be total damage, d be armor points, e be EPF, and t be armor toughness points, the equation is: (-(25(t + 8) - d(t + 8) +- sqrt((25(t + 8) - d(t + 8))^2 + (400r(t + 8))/(1 - 0.04e))) / 8 ... the whole thing is also in a max function up against r / (1 - 0.04e) * (1 - (d / 125))
#> Credits go to Topetyi for doing the algebra necessary to calculate said equation from the baseDamage -> totalDamage equation on the MC wiki
scoreboard players operation #totalDamage fintris.dummy1 = @a[tag=fintris.StealingArmor,limit=1] fintris.damageDealt
scoreboard players add #totalDamage fintris.dummy1 5
scoreboard players operation #totalDamage fintris.dummy1 /= 10 fintris.dummy
execute store result score #armor fintris.dummy1 run attribute @s minecraft:generic.armor get
execute store result score #armorToughness fintris.dummy1 run attribute @s minecraft:generic.armor_toughness get

#> Calculate EPF
execute store result score #epfFeet fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:100b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfLegs fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:101b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfChest fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:102b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfHead fintris.dummy1 run data get entity @s[type=player] Inventory[{Slot:103b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfFeet fintris.dummy1 run data get entity @s[type=!player] ArmorItems[0].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfLegs fintris.dummy1 run data get entity @s[type=!player] ArmorItems[1].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfChest fintris.dummy1 run data get entity @s[type=!player] ArmorItems[2].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score #epfHead fintris.dummy1 run data get entity @s[type=!player] ArmorItems[3].tag.Enchantments[{id:"minecraft:protection"}].lvl
scoreboard players operation #epfCalc fintris.dummy1 += #epfFeet fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfLegs fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfChest fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 += #epfHead fintris.dummy1
execute if score #epfCalc fintris.dummy1 > 20 fintris.dummy run scoreboard players set #epf fintris.dummy1 20
scoreboard players set #epf fintris.dummy1 25
scoreboard players operation #epf fintris.dummy1 -= #epfCalc fintris.dummy1
# tellraw @a [{"text":"EPF calculation ... 20 expected .. result: "},{"score":{"objective":"fintris.UUID3","name":"@s"}}]

#> First calculation ... -(25(t + 8) - d(t + 8))
scoreboard players operation #armorToughness fintris.dummy1 += 8 fintris.dummy1 
scoreboard players operation #storedToughness fintris.dummy1 = #armorToughness fintris.dummy1
scoreboard players operation #storedToughness fintris.dummy1 *= #armor fintris.dummy1
scoreboard players operation #calc2 fintris.dummy1 = #armorToughness fintris.dummy1
scoreboard players operation #calc2 fintris.dummy1 *= 25 fintris.dummy 
scoreboard players operation #calc2 fintris.dummy1 -= #storedToughness fintris.dummy1
#> Storing non-negative value for next calculation since it's used again there
scoreboard players operation #calc1 fintris.dummy1 = #calc2 fintris.dummy1
#> ... and back to the normal function
scoreboard players operation #calc2 fintris.dummy1 *= -1 fintris.dummy
# tellraw @a [{"text":"Equation 1 ... -80 expected .. result: "},{"score":{"objective":"fintris.UUID1","name":"@s"}}]

#> Second calculation ... (25(t + 8) - d(t + 8))^2 + (400r(t + 8))/(1 - 0.04e)
scoreboard players operation #storedDamage fintris.dummy1 = #totalDamage fintris.dummy1
scoreboard players operation #storedDamage fintris.dummy1 *= 400 fintris.dummy
scoreboard players operation #storedDamage fintris.dummy1 *= #armorToughness fintris.dummy1
scoreboard players operation #storedDamage fintris.dummy1 *= 25 fintris.dummy
scoreboard players operation #storedDamage fintris.dummy1 /= #epf fintris.dummy1
# tellraw @a [{"text":"Equation 2.1 ... 24000 expected .. result: "},{"score":{"objective":"fintris.dummy1","name":"@s"}}]
#> We already have 25(t + 8) - d(t + 8) from the first calculation, snatched away in #calc1 ... now we just need to square it
scoreboard players operation #calc1 fintris.dummy1 *= #calc1 fintris.dummy1
scoreboard players operation #calc1 fintris.dummy1 += #storedDamage fintris.dummy1
# tellraw @a [{"text":"Equation 2 ... 30400 expected .. result: "},{"score":{"objective":"fintris.UUID0","name":"@s"}}]

#> Resetting scores ... preparation for square root ... final value is #val1
scoreboard players set #val1 fintris.dummy1 0
scoreboard players set #val2 fintris.dummy1 32767
function orchid:square_root
# tellraw @a [{"text":"Equation 3 ... ~174 expected .. result: "},{"score":{"objective":"fintris.dummy1","name":"@s"}}]

#> Add two halves together and divide by 8
scoreboard players operation #calc2 fintris.dummy1 += #val1 fintris.dummy1
# scoreboard players operation @s fintris.dummy1 *= 125 fintris.dummy
# scoreboard players operation @s fintris.dummy1 /= @s fintris.UUID3
scoreboard players add #calc2 fintris.dummy1 4
scoreboard players operation #calc2 fintris.dummy1 /= 8 fintris.dummy
# tellraw @a [{"text":"Equation 4 ... 94 expected ... result: "},{"score":{"objective":"fintris.UUID1","name":"@s"}}]
execute if score #calc2 fintris.dummy1 < #totalDamage fintris.dummy1 run scoreboard players operation #calc2 fintris.dummy1 = #totalDamage fintris.dummy1
# tellraw @a [{"text":"Equation 4.2 ... 12 expected ... result: "},{"score":{"objective":"fintris.UUID1","name":"@s"}}]

#> max() function with r / (1 - 0.04e) * (1 - (d / 125))
scoreboard players set #val1 fintris.dummy1 25
scoreboard players operation #val1 fintris.dummy1 -= #epfCalc fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 = #epf fintris.dummy1
scoreboard players operation #epfCalc fintris.dummy1 *= 4 fintris.dummy
execute store result score #val1 fintris.dummy1 run attribute @s minecraft:generic.armor get
scoreboard players operation #val1 fintris.dummy1 *= 100 fintris.dummy
scoreboard players operation #val1 fintris.dummy1 /= 125 fintris.dummy
scoreboard players set #val2 fintris.dummy1 100
scoreboard players operation #val2 fintris.dummy1 -= #val1 fintris.dummy1
scoreboard players operation #val2 fintris.dummy1 -= #epfCalc fintris.dummy1
# tellraw @a [{"text":"Equation 5.1 ... 67 expected .. result: "},{"score":{"objective":"fintris.UUID0","name":"@s"}}]
scoreboard players operation #totalDamage fintris.dummy1 /= #val2 fintris.dummy1
# tellraw @a [{"text":"Equation 5 ... ~4.4 expected .. result: "},{"score":{"objective":"fintris.dummy3","name":"@s"}}]
execute if score #totalDamage fintris.dummy1 > #calc2 fintris.dummy1 run scoreboard players operation #calc2 fintris.dummy1 = #totalDamage fintris.dummy1
# tellraw @a [{"text":"Final answer for 'b': "},{"score":{"objective":"fintris.UUID1","name":"@s"}}]

#> Reset
scoreboard players reset #totalDamage fintris.dummy1
scoreboard players reset #armor fintris.dummy1
scoreboard players reset #totalDamage fintris.dummy1
scoreboard players reset #armorToughness fintris.dummy1
scoreboard players reset #epfFeet fintris.dummy1
scoreboard players reset #epfLegs fintris.dummy1
scoreboard players reset #epfChest fintris.dummy1
scoreboard players reset #epfHead fintris.dummy1
scoreboard players reset #epfCalc fintris.dummy1
scoreboard players reset #epf fintris.dummy1
scoreboard players reset #storedToughness fintris.dummy1
scoreboard players reset #calc1 fintris.dummy1
scoreboard players reset #storedDamage fintris.dummy1
scoreboard players reset #val1 fintris.dummy1
scoreboard players reset #val2 fintris.dummy1
#> Final value = #calc2 fintris.dummy1
# Finding base damage from total damage ... if we let r be total damage, d be armor points, e be EPF, and t be armor toughness points, the equation is: (-(25(t + 8) - d(t + 8) +- sqrt((25(t + 8) - d(t + 8))^2 + (400r(t + 8))/(1 - 0.04e))) / 8 ... the whole thing is also in a max function up against r / (1 - 0.04e) * (1 - (d / 125))
# UUID scoreboards are used as dummy scores here, as I needed more than the 3 I use elsewhere in Fused and entities having armor stolen from them aren't using UUID scores for anything else
# Credits go to Topetyi for doing the algebra necessary to calculate said equation from the baseDamage -> totalDamage equation on the MC wiki
scoreboard players operation @s fused.dummy1 = @a[tag=fused.StealingArmor,limit=1] fused.damageDealt
scoreboard players add @s fused.dummy1 5
scoreboard players operation @s fused.dummy1 /= 10 fused.mana
execute store result score @s fused.dummy2 run attribute @s minecraft:generic.armor get
execute store result score @s fused.dummy3 run attribute @s minecraft:generic.armor_toughness get
tellraw @a [{"text":"r = "},{"score":{"objective":"fused.dummy1","name":"@s"}}]
tellraw @a [{"text":"d = "},{"score":{"objective":"fused.dummy2","name":"@s"}}]
tellraw @a [{"text":"t = "},{"score":{"objective":"fused.dummy3","name":"@s"}}]

# Calculate EPF
execute store result score @s[type=player] fused.UUID0 run data get entity @s Inventory[{Slot:100b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=player] fused.UUID1 run data get entity @s Inventory[{Slot:101b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=player] fused.UUID2 run data get entity @s Inventory[{Slot:102b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=player] fused.UUID3 run data get entity @s Inventory[{Slot:103b}].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=!player] fused.UUID0 run data get entity @s ArmorItems[0].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=!player] fused.UUID1 run data get entity @s ArmorItems[1].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=!player] fused.UUID2 run data get entity @s ArmorItems[2].tag.Enchantments[{id:"minecraft:protection"}].lvl
execute store result score @s[type=!player] fused.UUID3 run data get entity @s ArmorItems[3].tag.Enchantments[{id:"minecraft:protection"}].lvl
scoreboard players operation @s fused.UUID2 += @s fused.UUID0
scoreboard players operation @s fused.UUID2 += @s fused.UUID1
scoreboard players operation @s fused.UUID2 += @s fused.UUID3
scoreboard players set @s[scores={fused.UUID2=21..}] fused.UUID2 20
scoreboard players set @s fused.UUID3 25
scoreboard players operation @s fused.UUID3 -= @s fused.UUID2
tellraw @a [{"text":"EPF calculation ... 20 expected .. result: "},{"score":{"objective":"fused.UUID3","name":"@s"}}]

# First calculation ... -(25(t + 8) - d(t + 8))
scoreboard players operation @s fused.dummy3 += 8 fused.mana
scoreboard players operation @s fused.UUID0 = @s fused.dummy3
scoreboard players operation @s fused.UUID0 *= @s fused.dummy2
scoreboard players operation @s fused.UUID1 = @s fused.dummy3
scoreboard players operation @s fused.UUID1 *= 25 fused.mana
scoreboard players operation @s fused.UUID1 -= @s fused.UUID0
# Storing non-negative value for next calculation since it's used again there
scoreboard players operation @s fused.UUID0 = @s fused.UUID1
# ... and back to the normal function
scoreboard players operation @s fused.UUID1 *= -1 fused.mana
tellraw @a [{"text":"Equation 1 ... -80 expected .. result: "},{"score":{"objective":"fused.UUID1","name":"@s"}}]

# Second calculation ... (25(t + 8) - d(t + 8))^2 + (400r(t + 8))/(1 - 0.04e)
scoreboard players operation @s fused.dummy1 *= 400 fused.mana
scoreboard players operation @s fused.dummy1 *= @s fused.dummy3
scoreboard players operation @s fused.dummy1 *= 25 fused.mana
scoreboard players operation @s fused.dummy1 /= @s fused.UUID3
tellraw @a [{"text":"Equation 2.1 ... 24000 expected .. result: "},{"score":{"objective":"fused.dummy1","name":"@s"}}]
# We already have 25(t + 8) - d(t + 8) from the first calculation, snatched away in fused.UUID0 ... now we just need to square it
scoreboard players operation @s fused.UUID0 *= @s fused.UUID0
scoreboard players operation @s fused.UUID0 += @s fused.dummy1
tellraw @a [{"text":"Equation 2 ... 30400 expected .. result: "},{"score":{"objective":"fused.UUID0","name":"@s"}}]

# Resetting scores ... preparation for square root ... final value is fused.dummy1
scoreboard players set @s fused.dummy1 0
scoreboard players set @s fused.dummy2 32767
function fused:square_root
tellraw @a [{"text":"Equation 3 ... ~174 expected .. result: "},{"score":{"objective":"fused.dummy1","name":"@s"}}]

# Add two halves together and divide by 8
scoreboard players operation @s fused.UUID1 += @s fused.dummy1
scoreboard players operation @s fused.dummy1 = @a[tag=fused.StealingArmor,limit=1] fused.damageDealt
scoreboard players add @s fused.dummy1 5
scoreboard players operation @s fused.dummy1 /= 10 fused.mana
# scoreboard players operation @s fused.dummy1 *= 125 fused.mana
# scoreboard players operation @s fused.dummy1 /= @s fused.UUID3
scoreboard players add @s fused.UUID1 4
scoreboard players operation @s fused.UUID1 /= 8 fused.mana
tellraw @a [{"text":"Equation 4 ... 94 expected ... result: "},{"score":{"objective":"fused.UUID1","name":"@s"}}]
execute if score @s fused.UUID1 < @s fused.dummy1 run scoreboard players operation @s fused.UUID1 = @s fused.dummy1
tellraw @a [{"text":"Equation 4.2 ... 12 expected ... result: "},{"score":{"objective":"fused.UUID1","name":"@s"}}]

# max() function with r / (1 - 0.04e) * (1 - (d / 125))
scoreboard players set @s fused.dummy2 25
scoreboard players operation @s fused.dummy2 -= @s fused.UUID3
scoreboard players operation @s fused.UUID3 = @s fused.dummy2
scoreboard players operation @s fused.UUID3 *= 4 fused.mana
execute store result score @s fused.dummy2 run attribute @s minecraft:generic.armor get
scoreboard players operation @s fused.dummy2 *= 100 fused.mana
scoreboard players operation @s fused.dummy2 /= 125 fused.mana
scoreboard players operation @s fused.dummy3 = @a[tag=fused.StealingArmor,limit=1] fused.damageDealt
scoreboard players add @s fused.dummy3 5
scoreboard players operation @s fused.dummy3 *= 10 fused.mana
scoreboard players set @s fused.UUID0 100
scoreboard players operation @s fused.UUID0 -= @s fused.dummy2
scoreboard players operation @s fused.UUID0 -= @s fused.UUID3
tellraw @a [{"text":"Equation 5.1 ... 67 expected .. result: "},{"score":{"objective":"fused.UUID0","name":"@s"}}]
scoreboard players operation @s fused.dummy3 /= @s fused.UUID0
tellraw @a [{"text":"Equation 5 ... ~4.4 expected .. result: "},{"score":{"objective":"fused.dummy3","name":"@s"}}]
execute if score @s fused.dummy3 > @s fused.UUID1 run scoreboard players operation @s fused.UUID1 = @s fused.dummy3
tellraw @a [{"text":"Final answer for 'b': "},{"score":{"objective":"fused.UUID1","name":"@s"}}]

# Reset
scoreboard players reset @s fused.dummy1
scoreboard players reset @s fused.dummy2
scoreboard players reset @s fused.dummy3
scoreboard players reset @s fused.UUID0
scoreboard players reset @s fused.UUID1
scoreboard players reset @s fused.UUID2
scoreboard players reset @s fused.UUID3
# Function by TheViralMelon#3716

tag @s add noCooldown
particle minecraft:dust_color_transition 0.600 0.212 0.812 1 0.702 0.961 1.000 ~ ~1 ~ 0.5 0.6 0.5 0.1 20 normal
particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 0.6 0.5 0.02 20 normal

playsound minecraft:block.anvil.place player @a ~ ~ ~ 0.5 2
playsound minecraft:ui.button.click player @a ~ ~ ~ 0.5 1.5
playsound minecraft:entity.player.death player @a ~ ~ ~ 1 1.5
playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 1 2
playsound minecraft:block.note_block.basedrum player @a ~ ~ ~ 1 2
playsound minecraft:block.note_block.xylophone player @a ~ ~ ~ 1 1.2
playsound minecraft:block.note_block.cow_bell player @a ~ ~ ~ 1 1.2
playsound minecraft:entity.arrow.hit_player player @a ~ ~ ~ 1 0.8
playsound minecraft:block.glass.break player @a ~ ~ ~ 1 0.7
advancement grant @s only orchid:bug
resource change @s orchid:fintris/alien_body_starlight 25
advancement grant @s only minecraft:story/deflect_arrow
particle dust 0.467 0.000 1.000 1 ~ ~ ~ 0.3 0.8 0.3 0.1 15 force

execute at @s positioned ~ ~0.65 ~ run execute as @e[type=#impact_projectiles,distance=..3.5,tag=!deflected] at @s run function orchid:fintris/deflect
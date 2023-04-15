# Setup
function orchid:fintris/fx/max_starlight
resource set @s orchid:fintris/starlight_decrease_resource 0
tag @s add starlight.clear

# Execution
power grant @s orchid:fintris/starlight_heal_loop orchid:fintris
scoreboard players set #1 fintris.dummy1 1

# Text
execute if score #heal fintris.dummy1 >= #1 fintris.dummy1 run title @s actionbar [{"text":"- ❤ Healed ","color":"light_purple"},{"score":{"objective":"fintris.dummy1","name":"#heal"},"color":"light_purple"},{"text":"! ❤ -","color":"light_purple"}]
execute if score #cdr fintris.dummy1 >= #1 fintris.dummy1 run title @s actionbar [{"text":"- ꩜ E. Step cooldown reduced by ","color":"dark_aqua"},{"score":{"objective":"fintris.dummy1","name":"#cdr"},"color":"dark_aqua"},{"text":"s ꩜ -","color":"dark_aqua"}]
execute if score #heal fintris.dummy1 >= #1 fintris.dummy1 run execute if score #cdr fintris.dummy1 >= #1 fintris.dummy1 run title @s actionbar [{"text":"- ❤ Healed ","color":"light_purple"},{"score":{"objective":"fintris.dummy1","name":"#heal"},"color":"light_purple"},{"text":"! ❤ ","color":"light_purple"},{"text":"꩜ E. Step cooldown reduced by ","color":"dark_aqua"},{"score":{"objective":"fintris.dummy1","name":"#cdr"},"color":"dark_aqua"},{"text":"s! ꩜ -","color":"dark_aqua"}]

# Reset
scoreboard players reset #heal fintris.dummy1
scoreboard players reset #cdr fintris.dummy1
scoreboard players reset #1 fintris.dummy1
resource set @s orchid:fintris/starlight_decrease_starlight_calc 0
resource set @s orchid:fintris/alien_body_starlight 0
# Setup
function orchid:fintris/fx/max_starlight
resource set @s orchid:fintris/alien_body_starlight 0
power grant @s orchid:fintris/decrease_reset
tag @s add starlight.clear

# Execution
power grant @s orchid:fintris/starlight_heal_full orchid:fintris

# Text
execute as @s[tag=starlight.heal,tag=!starlight.cdr] run title @s actionbar [{"text":"- ❤ Fully healed! ❤ -","color":"light_purple","bold":false}]
execute as @s[tag=starlight.cdr,tag=!starlight.heal] run title @s actionbar [{"text":"- ꩜ E. Step cooldown reset! ꩜ -","color":"dark_aqua","bold":false}]
execute as @s[tag=starlight.heal,tag=starlight.cdr] run title @s actionbar [{"text":"- ❤ Fully healed! ❤ ","color":"light_purple","bold":false},{"text":"꩜ E. Step cooldown reset! ꩜ -","color":"dark_aqua","bold":false}]

execute as @s[tag=starlight.heal,tag=!starlight.cdr] run advancement grant @s only orchid:thestars
execute as @s[tag=starlight.heal,tag=starlight.cdr] run advancement grant @s only orchid:thestars

execute as @s[tag=starlight.cdr,tag=!starlight.heal] run advancement grant @s only orchid:transmutation
execute as @s[tag=starlight.heal,tag=starlight.cdr] run advancement grant @s only orchid:transmutation

# Reset
tag @s remove starlight.heal
tag @s remove starlight.cdr
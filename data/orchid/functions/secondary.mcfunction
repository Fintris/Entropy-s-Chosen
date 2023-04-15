tag @s add self
execute unless entity @s[tag=used_secondary] if entity @s[tag=jump,tag=!crouch,tag=!right,tag=!left,tag=!backwards,tag=!forward] at @s positioned ~ ~6 ~ run function orchid:secondary/backray
execute unless entity @s[tag=used_secondary] if entity @s[tag=crouch,tag=!jump,tag=!right,tag=!left,tag=!backwards,tag=!forward] at @s positioned ~ ~-6 ~ run function orchid:secondary/backray

execute unless entity @s[tag=used_secondary] if entity @s[tag=forward,tag=!left,tag=!right,tag=!backwards] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^3.75 run function orchid:secondary/backray
execute unless entity @s[tag=used_secondary] if entity @s[tag=backwards,tag=!left,tag=!right,tag=!forward] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^-3.75 run function orchid:secondary/backray

execute unless entity @s[tag=used_secondary] if entity @s[tag=forward,tag=right,tag=!backwards,tag=!left] at @s rotated as @s rotated ~ 0 positioned ^-3.0525 ^ ^3.0525 run function orchid:secondary/backray
execute unless entity @s[tag=used_secondary] if entity @s[tag=backwards,tag=right,tag=!forward,tag=!left] at @s rotated as @s rotated ~ 0 positioned ^-3.0525 ^ ^-3.0525 run function orchid:secondary/backray

execute unless entity @s[tag=used_secondary] if entity @s[tag=forward,tag=left,tag=!backwards,tag=!right] at @s rotated as @s rotated ~ 0 positioned ^3.0525 ^ ^3.0525 run function orchid:secondary/backray
execute unless entity @s[tag=used_secondary] if entity @s[tag=backwards,tag=left,tag=!forward,tag=!right] at @s rotated as @s rotated ~ 0 positioned ^3.0525 ^ ^-3.0525 run function orchid:secondary/backray

execute unless entity @s[tag=used_secondary] if entity @s[tag=left,tag=!right,tag=!backwards,tag=!forward] at @s rotated as @s rotated ~ 0 positioned ^3.75 ^ ^ run function orchid:secondary/backray
execute unless entity @s[tag=used_secondary] if entity @s[tag=right,tag=!left,tag=!backwards,tag=!forward] at @s rotated as @s rotated ~ 0 positioned ^-3.75 ^ ^ run function orchid:secondary/backray

tag @s add used_secondary
tag @s remove self
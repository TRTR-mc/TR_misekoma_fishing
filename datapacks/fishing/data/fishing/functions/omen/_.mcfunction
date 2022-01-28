#> fishing:omen/_
#
# 前兆
#
# @within function fishing:player

# TR_fishの制御
scoreboard players set @s TR.fish_caught 1

# timer
scoreboard players add @s TR.timer 1

# noise
execute if score @s TR.timer matches 1 anchored eyes run particle dust 0 100000000 0 0.1 ^ ^ ^2 0 0 0 0 1 force
execute if score @s TR.timer matches 1 run function fishing:sound/noise

# 怪物召喚
execute if score @s TR.timer matches 1 at @e[type=marker,tag=bober,distance=..20,limit=1] run summon drowned ~ ~1 ~ {Tags:["monstar"],ArmorItems:[{},{},{},{Count:1b,id:"glass",tag:{CustomModelData:1}}],HandItems:[{Count:1b,id:"fishing_rod"}],NoAI:1b,NoGravity:1b}
execute if score @s TR.timer matches 1 as @e[type=drowned,tag=monstar,distance=..30,limit=1] at @s run tp @s ~ ~ ~ facing entity @p

# blood
execute if score @s TR.timer matches 5 anchored eyes run particle dust 100000000 100000000 0 0.1 ^ ^ ^1.5 0 0 0 0 1 force

# noise
execute if score @s TR.timer matches 13 anchored eyes run particle dust 0 100000000 0 0.1 ^ ^ ^1.0 0 0 0 0 1 force
execute if score @s TR.timer matches 13 run function fishing:sound/noise
execute if score @s TR.timer matches 13 run tp @e[type=drowned,tag=monstar,distance=..30,limit=1] ~ -200 ~

# finish
execute if score @s TR.timer matches 17 anchored eyes run particle dust 0 0 100000000 0.1 ^ ^ ^0.5 0 0 0 0 1 force
execute if score @s TR.timer matches 17 run kill @e[type=marker,tag=bober,distance=..20,limit=1]
execute if score @s TR.timer matches 17 run scoreboard players set @s TR.fish_caught 2
execute if score @s TR.timer matches 17 run scoreboard players reset @s TR.timer
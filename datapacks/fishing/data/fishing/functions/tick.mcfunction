#> fishing:tick
# @within tag/function minecraft:tick

# player
execute as @a at @s run function fishing:player

# monstar
execute as @e[type=drowned,tag=monstar] at @s run function fishing:particle
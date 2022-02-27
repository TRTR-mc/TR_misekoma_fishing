#> fishing:bober/_
# @within function fishing:player

# reset
scoreboard players reset @s TR.fishing_rod
tag @s remove bait

# 条件に適合するとき、浮きの位置にマーカーを置く処理を予約
tag @s add bait
execute if entity @s[tag=bait] run schedule function fishing:bober/spawn_marker 1s append
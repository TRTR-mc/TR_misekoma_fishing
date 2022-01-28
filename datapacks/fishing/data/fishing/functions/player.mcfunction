#> fishing:player
# @within function fishing:tick

# 浮きの位置
execute if score @s TR.fishing_rod matches 1.. run function fishing:bober/_

# 前兆
execute if score @s TR.fish_caught matches 1 run function fishing:omen/_

# 本番
execute if score @s TR.fish_caught matches 3 run function fishing:curse/_

# 死
execute if score @s TR.death matches 1.. run function fishing:death

# 死
execute if score @s TR.respawn matches 1..20 run function fishing:respawn
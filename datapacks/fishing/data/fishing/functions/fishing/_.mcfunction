#> fishing:fishing/_
#
# 糸
#
# @within function fishing:curse/_

# monster
kill @e[type=marker,tag=String,distance=..40]
execute at @e[type=drowned,tag=monstar,distance=..40,limit=1] run summon marker ^-0.3 ^1.2 ^1.3 {Tags:["String"]}

# 再帰処理で糸を表現
execute positioned ~ ~1.3 ~ run function fishing:fishing/loop
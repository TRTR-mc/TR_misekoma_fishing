#> fishing:curse/_
#
# ころされる
#
# @within function fishing:player

# TR_fishの制御
scoreboard players set @s TR.fish_caught 3

# timer
scoreboard players add @s TR.timer 1

# noise
execute if score @s TR.timer matches 1 anchored eyes run particle dust 0 100000000 0 0.1 ^ ^ ^2 0 0 0 1 1 force
execute if score @s TR.timer matches 1 run function fishing:sound/noise

# 怪物召喚
execute if score @s TR.timer matches 1 at @e[type=marker,tag=bober,distance=..20,limit=1] run summon drowned ~ ~ ~ {Tags:["monstar"],ArmorItems:[{},{},{},{Count:1b,id:"glass",tag:{CustomModelData:1}}],HandItems:[{Count:1b,id:"fishing_rod"}],NoAI:1b,NoGravity:1b}
execute if score @s TR.timer matches 1 as @e[type=drowned,tag=monstar,distance=..100,limit=1] at @s run tp @s ~ ~ ~ facing entity @a[distance=..100,sort=nearest,limit=1]
execute if score @s TR.timer matches 2..5 run function fishing:sound/horror

# 視界を取り戻す
execute if score @s TR.timer matches 5 anchored eyes run particle dust 0 0 100000000 0.1 ^ ^ ^1.5 0 0 0 1 1 force

# 攻撃
execute if score @s TR.timer matches 41.. run function fishing:fishing/_
execute if score @s TR.timer matches 41..44 run function fishing:sound/chain
execute if score @s TR.timer matches 45 run playsound block.anvil.hit player @s ~ ~ ~ 1 1
execute if score @s TR.timer matches 41 anchored eyes run particle dust 100000000 100000000 0 0.1 ^ ^ ^0.2 0 0 0 1 1 force
execute if score @s TR.timer matches 41 run effect give @s instant_damage 1 1 true
execute if score @s TR.timer matches 41 run particle block redstone_block ^ ^1 ^1 0.1 0.1 0.1 1 20 force
execute if score @s TR.timer matches 45 anchored eyes run particle dust 0 0 100000000 0.1 ^ ^ ^0.1 0 0 0 1 1 force

# 振り向いた後
execute if score @s TR.timer matches 85..86 anchored eyes run particle dust 0 100000000 0 0.1 ^ ^ ^0.2 0 0 0 1 1 force
execute if score @s TR.timer matches 89..90 anchored eyes run particle dust 100000000 100000000 0 0.1 ^ ^ ^0.1 0 0 0 1 1 force

# 引きずる
execute if score @s TR.timer matches 105.. run function fishing:sound/horror
execute if score @s TR.timer matches 145.. run function fishing:sound/bubble
execute if score @s TR.timer matches 105..164 facing entity @e[type=drowned,tag=monstar,distance=..100,limit=1] eyes run tp @s ^ ^ ^0.1
execute if score @s TR.timer matches 165..301 facing entity @e[type=drowned,tag=monstar,distance=..100,limit=1] eyes run tp @s ^ ^ ^0.3
execute if score @s TR.timer matches 302..361 facing entity @e[type=drowned,tag=monstar,distance=..100,limit=1] eyes run tp @s ^ ^ ^1.0
execute if score @s TR.timer matches 105..165 as @e[type=drowned,tag=monstar,distance=..100,limit=1] at @s run tp ^ ^ ^-0.1
execute if score @s TR.timer matches 165..361 as @e[type=drowned,tag=monstar,distance=..100,limit=1] at @s run tp ^ ^-0.3 ^-0.3

# 暗転
execute if score @s TR.timer matches 341 run title @s times 10 60 1
execute if score @s TR.timer matches 341 run title @s title {"text": "\uE001","font": "black"}

# 殺害
execute if score @s TR.timer matches 362 run kill @s

# 終わり
execute if score @s TR.timer matches 381 anchored eyes run particle dust 0 0 100000000 0.1 ^ ^ ^1 0 0 0 1 1 force
execute if score @s TR.timer matches 381 run kill @e[type=drowned,tag=monstar,distance=..100]
execute if score @s TR.timer matches 381 run scoreboard players reset @s TR.fish_caught
execute if score @s TR.timer matches 381 run scoreboard players reset @s TR.timer
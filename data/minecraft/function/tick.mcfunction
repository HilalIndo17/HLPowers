# ============================================
# TICK.MCFUNCTION - Data Pack HLPowers
# Author: HilalIndo17
# Status: BETA - Testing to public
# ============================================

# === GAME SETTINGS ===
scoreboard objectives add exp_check dummy
scoreboard objectives add bow_use minecraft.used:minecraft.bow
scoreboard objectives add deathCount deathCount
scoreboard players reset @a[tag=power_owner] deathCount
tag @e[type=minecraft:experience_orb] add power_owner

# = Powers Access =
execute as @a[tag=!power_owner,scores={exp_check=30..},gamemode=!creative,gamemode=!spectator] at @s run experience set @s 26 levels
execute as @a[tag=!power_owner,scores={exp_check=30..},gamemode=!creative,gamemode=!spectator] at @s run function hl_powers:power/enable

# = Performance =
execute as @e[type=arrow,tag=arrow_boom] at @s if entity @a[tag=power_owner,distance=250..] run kill @s
execute as @e[type=arrow,tag=arrow_detonator] at @s if entity @a[tag=power_owner,distance=250..] run kill @s
execute as @e[type=arrow,tag=ballectric] at @s if entity @a[tag=power_owner,distance=250..] run kill @s

execute as @e[type=minecraft:snowball,tag=explodex] at @s if entity @a[tag=power_owner,distance=200..] run kill @s

execute as @e[type=minecraft:wind_charge,tag=brezzez] at @s if entity @a[tag=power_owner,distance=250..] run kill @s

# = Exp Adder =
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:silverfish,distance=..2] run summon experience_bottle ~ ~ ~
execute at @a[tag=power_owner] run execute as @e[type=minecraft:silverfish,distance=..2] at @s run particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 0.2 15
execute at @a[tag=power_owner] run kill @e[type=minecraft:silverfish,distance=..2]
execute at @a[tag=power_owner] run execute as @e[tag=!power_owner,nbt={HurtTime:10s},distance=..15] at @s run experience add @a[tag=power_owner] 5

# = Activator Target Giver =
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~1 ~ 0.5 0.5 0.5 0.1 2
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:shulker,distance=..4] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:strider,distance=..5] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:creaking,distance=..4] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:zombie_horse,distance=..3] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:mule,distance=..4] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:copper_golem,distance=..3] add target
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:redstone at @s run tag @e[type=minecraft:sniffer,distance=..3] add target


# === PLAYER STATS ===
# = Effect =
effect give @a[tag=power_owner] minecraft:night_vision 15 0 true
effect give @a[tag=power_owner] minecraft:health_boost 15 9 true
effect give @a[tag=power_owner] minecraft:saturation 30 3 true
effect give @a[tag=power_owner] minecraft:resistance 15 1 true
effect give @a[tag=power_owner] minecraft:water_breathing 15 0 true

# = Exp Indicator =
execute as @a at @s store result score @s exp_check run data get entity @s XpLevel 1
execute as @a at @s run execute at @e[type=!experience_orb,distance=..2] run title @s actionbar [{"text":"✨ ","color":"yellow"},{"text":"EXP","color":"green"},{"text":" » ","color":"gray"},{"text":"Level ","color":"yellow"},{"score":{"name":"@s","objective":"exp_check"},"color":"gold"}]
execute as @a at @s run execute at @e[type=experience_orb,distance=..2] run title @s actionbar [{"text":"✨ ","color":"yellow"},{"text":"EXP","color":"green"},{"text":" » ","color":"gray"},{"text":"Level ","color":"yellow"},{"score":{"name":"@s","objective":"exp_check"},"color":"gold"},{"text":" (+)","color":"green","bold":false}]
execute as @a[tag=power_owner] at @s run tp @e[type=minecraft:experience_orb,sort=nearest] @s

# = Disable Perm Effect =
execute as @a[tag=power_owner] at @s run tag @s remove struck
execute as @a[tag=power_owner] at @s run tag @s remove curse
execute as @a[tag=power_owner] at @s run tag @s remove frost
execute as @a[tag=power_owner] at @s run tag @s remove love
execute as @a[tag=power_owner] at @s run tag @s remove sonicate
execute as @a[tag=power_owner] at @s run tag @s remove blaze

# = Other =
execute as @a[tag=power_owner] at @s run particle minecraft:totem_of_undying ~ ~0.2 ~ 0.3 0.3 0.3 0.01 1
execute as @a[tag=power_owner] at @s run particle minecraft:dust{color:[1.0,0.4,0.0],scale:1} ~ ~1.2 ~ 0.5 0.8 0.5 0.01 1


# === MAIN POWER ===
# = TIER 1 =
#Telepearltation (DONE WORK)
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run tp @p ~ ~ ~
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.1 3
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run particle minecraft:dust{color:[1.0,0.0,1.0],scale:0.7} ~ ~ ~ 0.5 0.5 0.5 0.1 26
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run particle end_rod ~ ~ ~ 0.3 0.3 0.3 0.1 3
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run summon tnt ~ ~ ~ {fuse:5,explosion_power:0.2,block_state:{Name:"minecraft:air"}}
execute as @a[tag=power_owner] at @n[type=minecraft:ender_pearl] run effect give @a[tag=power_owner,distance=..3] minecraft:resistance 1 11

#EndermiTnT (DONE WORK)
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:endermite,distance=..4] run summon tnt ~ ~ ~ {fuse:3,explosion_power:2}
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:endermite,distance=..4] run particle minecraft:gust_emitter_large
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:endermite,distance=..4] run particle minecraft:lava
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:endermite,distance=..4] run particle minecraft:large_smoke
execute as @a[tag=power_owner] at @s run execute at @e[type=minecraft:endermite,distance=..4] run effect give @e[tag=!power_owner,distance=..5] minecraft:wither 3 1

#Brezzez Piercing (DONE WORK)
execute at @e[type=minecraft:wind_charge,tag=brezzez] run summon tnt ~ ~ ~ {fuse:1,explosion_power:2}
execute at @e[type=minecraft:wind_charge,tag=brezzez] run particle minecraft:flame
execute at @e[type=minecraft:wind_charge,tag=brezzez] run particle minecraft:campfire_signal_smoke
execute at @e[type=minecraft:wind_charge,tag=brezzez] run particle minecraft:lava
execute at @e[type=minecraft:wind_charge,tag=brezzez] run particle minecraft:wax_on

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:wind_charge,distance=..2] add brezzez

#Egg Fangs (DONE WORK)
execute at @e[type=egg,tag=eggfang] run summon minecraft:evoker_fangs ~ ~-1.5 ~
execute at @e[type=egg,tag=eggfang] run summon minecraft:evoker_fangs ~-1 ~-2 ~
execute at @e[type=egg,tag=eggfang] run summon minecraft:evoker_fangs ~1 ~-2 ~
execute at @e[type=egg,tag=eggfang] run summon minecraft:evoker_fangs ~ ~-2 ~1
execute at @e[type=egg,tag=eggfang] run summon minecraft:evoker_fangs ~ ~-2 ~-1
execute at @e[type=minecraft:egg,tag=eggfang] run particle minecraft:flame
execute at @e[type=minecraft:egg,tag=eggfang] run particle minecraft:smoke
execute at @e[type=minecraft:egg,tag=eggfang] run particle minecraft:wax_on

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:egg,distance=..2] add eggfang

#Woofly Orange (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:orange_wool at @s run summon minecraft:tnt ~ ~0.3 ~ {fuse:1,explosion_power:0.19}
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:orange_wool at @s run particle minecraft:flame
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:orange_wool at @s run particle minecraft:campfire_cosy_smoke

execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:orange_wool at @s run effect give @s minecraft:levitation 1 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:orange_wool at @s run particle minecraft:flame
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:orange_wool at @s run effect give @s minecraft:jump_boost 2 1

#Endeye Chaos (DONE WORK)
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run summon tnt ~ ~-0.2 ~ {fuse:5,explosion_power:1.5}
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run summon tnt ~-1 ~-0.26 ~ {fuse:60,explosion_power:0.7}
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run summon tnt ~1 ~-0.26 ~ {fuse:60,explosion_power:0.7}
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run summon tnt ~ ~-0.26 ~1 {fuse:60,explosion_power:0.7}
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run summon tnt ~ ~-0.26 ~-1 {fuse:60,explosion_power:0.7}
execute at @e[type=minecraft:eye_of_ender,tag=endeye] run particle minecraft:lava

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:eye_of_ender,distance=..2] add endeye

#Snowball Explodex (DONE WORK)
execute at @e[type=minecraft:snowball,tag=explodex] run summon tnt ~ ~ ~ {fuse:1,explosion_power:1}
execute at @e[type=minecraft:snowball,tag=explodex] run particle minecraft:flame
execute at @e[type=minecraft:snowball,tag=explodex] run tag @e[tag=!power_owner,distance=..1.5] add frost

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:snowball,distance=..5] add explodex

#Fireboom Rocket (DONE WORK)
execute at @e[type=minecraft:firework_rocket] run summon minecraft:snowball
execute at @e[type=minecraft:firework_rocket] run particle minecraft:flame
execute at @e[type=minecraft:firework_rocket] run particle minecraft:wax_on
execute at @e[type=minecraft:firework_rocket] run particle minecraft:campfire_cosy_smoke

#Splash Boom (DONE WORK)
execute at @e[type=minecraft:splash_potion,tag=splash_boom] run summon tnt ~ ~ ~ {fuse:1,explosion_power:1}
execute at @e[type=minecraft:splash_potion,tag=splash_boom] run particle minecraft:flame
execute at @e[type=minecraft:splash_potion,tag=splash_boom] run tag @e[tag=!power_owner,distance=..2.6] add curse

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:splash_potion,distance=..2] add splash_boom

#Lingerboom (DONE WORK)
execute at @e[type=minecraft:lingering_potion,tag=lingerboom] run summon minecraft:tnt ~ ~ ~ {fuse:3,explosion_power:2}
execute at @e[type=minecraft:lingering_potion,tag=lingerboom] run particle minecraft:flame
execute at @e[type=minecraft:lingering_potion,tag=lingerboom] run particle minecraft:wax_on

execute as @a[tag=power_owner] at @s run tag @e[type=minecraft:lingering_potion,distance=..2] add lingerboom

#TNT of All (DONE WORK)
execute at @e[type=minecraft:copper_golem,tag=target] positioned ~ ~ ~ run playsound minecraft:item.goat_horn.sound.5 player @a[distance=..70] ~ ~ ~ 2.6 1
execute at @e[type=minecraft:copper_golem,tag=target] run execute at @a[tag=power_owner,limit=1,sort=nearest] run execute at @e[tag=!power_owner,distance=..100] run summon tnt ~ ~ ~ {fuse:110,explosion_power:1.5}
execute at @e[type=minecraft:copper_golem,tag=target] run kill @e[type=minecraft:copper_golem]

#Singularity of TNT (DONE WORK)
execute at @e[type=minecraft:snow_golem] run tp @e[type=tnt,distance=..100,tag=!ritual,tag=!domain] ~ ~ ~
execute at @e[type=minecraft:snow_golem] run particle minecraft:flame
execute at @e[type=minecraft:snow_golem] run particle minecraft:lava
execute at @e[type=minecraft:snow_golem] run particle minecraft:reverse_portal ~ ~ ~ 1 1 1 0.1 26
execute at @e[type=minecraft:snow_golem] run effect give @e[type=minecraft:snow_golem] minecraft:resistance 1 2
execute at @e[type=minecraft:snow_golem] run execute at @e[type=minecraft:tnt,distance=..100] run particle minecraft:portal ~ ~ ~ 0.5 0.5 0.5 0.1 3

#Arrow Detonator (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:bow[minecraft:custom_name="Bow Detonator"] at @s run execute at @s run tag @e[type=arrow,distance=..2.6] add arrow_detonator
execute at @e[tag=arrow_detonator] run particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.1 2
execute at @e[tag=arrow_detonator] run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.1 1

execute as @p[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:bow[minecraft:custom_name="Bow Detonator"] at @s run execute at @e[tag=arrow_detonator] run summon tnt ~ ~ ~ {fuse:1,explosion_power:1.5}
execute as @p[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:bow[minecraft:custom_name="Bow Detonator"] at @s run execute as @e[tag=arrow_detonator] at @s run kill @s

#Rodhook (V2 FORM) (DONE WORK)
execute at @e[tag=hook] unless block ~ ~-0.5 ~ air as @a[tag=power_owner] at @p run tp @p ^ ^0.1 ^1 facing entity @e[tag=hook,limit=1]

execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[minecraft:custom_name="Rodhook"] at @s run tag @e[type=minecraft:fishing_bobber,distance=..2] add hook
execute at @e[tag=hook] unless block ~ ~-0.5 ~ air as @a[tag=power_owner] at @s run kill @e[tag=hook,distance=..2]

execute as @e[tag=hook] run execute as @a[tag=power_owner] at @s positioned ~ ~0.4 ~ unless block ^ ^ ^0.5 air as @a[tag=power_owner] at @s run kill @e[tag=hook]
execute as @e[tag=hook] run execute as @a[tag=power_owner] at @s positioned ~ ~0.4 ~ unless block ^ ^ ^0.5 air as @a[tag=power_owner] at @s run tp @s ^ ^ ^-0.2

#Endermage (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:chorus_fruit at @s run execute as @e[tag=power_owner,nbt={HurtTime:10s}] at @s run tp @s @e[limit=1,type=!arrow,type=!trident,sort=random,distance=..52]
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:chorus_fruit at @s run execute as @e[tag=power_owner,nbt={HurtTime:10s}] at @s run playsound minecraft:entity.enderman.teleport player @a[distance=..10] ~ ~ ~ 1 0.8 0.6
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:chorus_fruit at @s run execute as @e[tag=power_owner,nbt={HurtTime:10s}] at @s run particle minecraft:portal ~ ~0.5 ~ 0.5 0.5 0.5 0.1 200

execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:chorus_fruit at @s run execute as @e[tag=power_owner] at @s run particle minecraft:dust{color:[1.0,0.0,0.5],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:chorus_fruit at @s run execute as @e[tag=power_owner] at @s run particle minecraft:dust{color:[1.0,0.0,1.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 1

#execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:chorus_fruit at @s run execute as @e[tag=!power_owner,nbt={HurtTime:10s},distance=..3] at @s run execute as @a[tag=power_owner] at @s if score @s exp_check matches 1..999999999 run experience add @s -26 points
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:chorus_fruit at @s run execute as @e[tag=!power_owner,nbt={HurtTime:10s},distance=..3] as @a[tag=power_owner] at @s run tp @s @e[limit=1,type=!arrow,type=!trident,sort=random,distance=..26]
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:chorus_fruit at @s run execute as @e[tag=!power_owner,nbt={HurtTime:10s},distance=..3] as @a[tag=power_owner] at @s run playsound minecraft:entity.enderman.teleport player @a[distance=..10] ~ ~ ~ 1 0.8 0.6
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:chorus_fruit at @s run execute as @e[tag=!power_owner,nbt={HurtTime:10s},distance=..3] as @a[tag=power_owner] at @s run particle minecraft:portal ~ ~0.5 ~ 0.5 0.5 0.5 0.1 200

#Spiclimber (DONE WORK 90%)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s positioned ~ ~0.5 ~ unless block ^ ^ ^0.5 air unless block ^ ^ ^0.5 short_grass unless block ^ ^ ^0.5 tall_grass unless block ^ ^ ^0.5 wildflowers unless block ^ ^ ^0.5 tall_dry_grass unless block ^ ^ ^0.5 short_dry_grass unless block ^ ^ ^0.5 dead_bush unless block ^ ^ ^0.5 bush unless block ^ ^ ^0.5 #saplings unless block ^ ^ ^0.5 #minecraft:flowers unless block ^ ^ ^0.5 firefly_bush unless block ^ ^ ^0.5 sugar_cane unless block ^ ^ ^0.5 minecraft:fern unless block ^ ^ ^0.5 large_fern unless block ^ ^ ^0.5 fire unless block ^ ^ ^0.5 brown_mushroom unless block ^ ^ ^0.5 red_mushroom unless block ^ ^ ^0.5 pink_petals unless block ^ ^ ^0.5 leaf_litter unless block ^ ^ ^0.5 wheat unless block ^ ^ ^0.5 beetroots unless block ^ ^ ^0.5 potatoes run effect give @s minecraft:levitation 1 4 true
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s positioned ~ ~0.5 ~ unless block ^ ^ ^0.5 air run particle minecraft:dust{color:[1.0,1.0,1.0],scale:0.5} ~ ~0.5 ~ 0.2 0.1 0.2 0 5
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s positioned ~ ~0.5 ~ unless block ^ ^ ^0.5 air run particle minecraft:block{block_state:"minecraft:cobweb"} ~ ~0.5 ~ 0.2 0.1 0.2 0 11

execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s positioned ~ ~0.45 ~ if block ^ ^ ^0.5 air run effect clear @s minecraft:levitation
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s run particle minecraft:dust{color:[0.1,0.1,0.1],scale:0.8} ~ ~0.5 ~ 0.4 0.4 0.4 0.1 11
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:string at @s run execute as @a[tag=power_owner] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.1 0.1 0.02 1
execute as @a[tag=power_owner] at @s unless items entity @s weapon.mainhand minecraft:string at @s unless items entity @s weapon.mainhand minecraft:orange_wool at @s run effect clear @s minecraft:levitation


# = TIER 2 =
#Rod of Boom (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[!minecraft:custom_name="Rodhook",!minecraft:custom_name="Ultiblast",minecraft:custom_name="Rod of Boom"] at @s run execute at @e[type=minecraft:fishing_bobber] run summon tnt ~ ~ ~ {fuse:1,explosion_power:1.5}
execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[!minecraft:custom_name="Rodhook",!minecraft:custom_name="Ultiblast",minecraft:custom_name="Rod of Boom"] at @s run execute at @e[type=minecraft:fishing_bobber] run particle minecraft:flame
execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[!minecraft:custom_name="Rodhook",!minecraft:custom_name="Ultiblast",minecraft:custom_name="Rod of Boom"] at @s run execute at @e[type=minecraft:fishing_bobber] run particle minecraft:wax_on
execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[!minecraft:custom_name="Rodhook",!minecraft:custom_name="Ultiblast",minecraft:custom_name="Rod of Boom"] at @s run execute at @e[type=minecraft:fishing_bobber] run effect give @p[tag=power_owner] minecraft:jump_boost 1 0
execute as @a[tag=power_owner] at @s if items entity @s weapon.* minecraft:fishing_rod[!minecraft:custom_name="Rodhook",!minecraft:custom_name="Ultiblast",minecraft:custom_name="Rod of Boom"] at @s run execute at @e[type=minecraft:fishing_bobber] run effect give @p[tag=power_owner] minecraft:resistance 1 1

#Sluggish Domain (DONE WORK)
execute at @e[type=minecraft:strider,tag=target] run summon tnt ~ ~ ~ {fuse:200,explosion_power:0.1,Tags:["freeze"]}
execute at @e[type=minecraft:strider,tag=target] run playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 1 0.5
execute at @e[type=minecraft:strider,tag=target] run playsound minecraft:block.bell.use player @a ~ ~ ~ 1 1.5
kill @e[type=strider,tag=target]

execute at @e[type=tnt,tag=freeze] run particle minecraft:end_rod ~ ~ ~ 0.3 0.3 0.3 0.1 10
execute at @e[type=tnt,tag=freeze] run particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.01 20
execute at @e[type=tnt,tag=freeze] run execute at @e[distance=..50,tag=!power_owner] run particle minecraft:ash ~ ~ ~ 0.5 0.5 0.5 0.5 10
execute at @e[type=tnt,tag=freeze] run effect give @e[distance=..50,tag=!power_owner,type=!minecraft:fishing_bobber] minecraft:slowness 2 255
execute at @e[type=tnt,tag=freeze] run effect give @e[distance=..50,tag=!power_owner] minecraft:blindness 2 3
execute at @e[type=tnt,tag=freeze] run execute as @e[tag=!power_owner,type=!minecraft:fishing_bobber,type=!tnt,type=!armor_stand] at @s if block ~ ~-0.1 ~ air run tp @s ~ ~-0.5 ~

#Storm Shield (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run effect give @s minecraft:speed 1 26
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 5
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run effect give @s minecraft:glowing 1 0 true
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run setblock ^ ^ ^-2 fire keep
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run effect give @s minecraft:fire_resistance 1 26

execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run execute at @e[tag=!power_owner,distance=..3,tag=!struck] run summon minecraft:lightning_bolt ~ ~ ~
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run execute at @e[tag=!power_owner,distance=..3,tag=!struck] run summon tnt ~ ~ ~ {fuse:1,explosion_power:0.3}
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run effect give @e[tag=!power_owner,distance=..3,tag=!struck] minecraft:wither 5 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run playsound minecraft:entity.player.attack.sweep player @s ~ ~ ~ 0.1 1.5
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run effect give @e[tag=!power_owner,distance=..3,tag=!struck] minecraft:weakness 10 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:shield at @s run tag @e[tag=!power_owner,tag=!struck,distance=..3] add struck

#Bloodseeker (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run particle minecraft:soul_fire_flame ^ ^0.5 ^1 0.3 0.2 0.3 0.01 10
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run playsound minecraft:entity.player.hurt player @a ~ ~ ~ 0.1 0.6
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run tp @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] ^ ^0.5 ^1
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run particle minecraft:damage_indicator ^ ^0.5 ^1 1 0.5 1 0.1 30
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run particle minecraft:sweep_attack ^ ^0.5 ^1 1 0.5 1 0.1 20
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run effect give @e[tag=!power_owner,type=!arrow,distance=..3,limit=1] minecraft:wither 2 11
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run effect give @e[tag=!power_owner,type=!arrow,distance=..3,limit=1] minecraft:weakness 2 1
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run effect give @s minecraft:strength 15
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run playsound minecraft:entity.generic.eat player @a ~ ~ ~ 0.4 0.8
execute as @a[tag=power_owner] at @s positioned ^ ^0.5 ^1 run execute at @e[tag=!power_owner,type=!item,type=!arrow,distance=..3,limit=1] run execute if items entity @s weapon.mainhand minecraft:heart_of_the_sea at @s positioned ^ ^0.5 ^1 run playsound minecraft:entity.player.splash player @a ~ ~ ~ 0.4 0.5

execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:heart_of_the_sea at @s run particle minecraft:dripping_dripstone_lava ~ ~ ~ 0.4 0.2 0.4 0.01 5
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:heart_of_the_sea at @s run particle minecraft:damage_indicator ~ ~ ~ 0.3 0.3 0.3 1 20
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:heart_of_the_sea at @s run effect give @s minecraft:jump_boost 1 2
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:heart_of_the_sea at @s run effect give @s minecraft:speed 1 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:heart_of_the_sea at @s run effect give @s minecraft:strength 1 1

#Death Orb (DONE WORK)
execute at @e[type=minecraft:creaking,tag=target] run summon tnt ~ ~4.5 ~ {fuse:200,explosion_power:0.5,block_state:{Name:"minecraft:air"},Tags:["laser"]}
execute at @e[type=minecraft:creaking,tag=target] run playsound minecraft:entity.evoker.prepare_summon player @a ~ ~ ~ 3 1.1
kill @e[type=minecraft:creaking,tag=target]

execute as @e[type=tnt,tag=laser] at @s if block ~ ~-0.01 ~ air run tp @s ~ ~0.042 ~
execute at @e[type=tnt,tag=laser] run particle minecraft:dust{color:[0,0.0,0.0],scale:1.0} ~ ~ ~ 0.5 0.5 0.5 0 100
execute at @e[type=tnt,tag=laser] run playsound minecraft:entity.wither.ambient player @a ~ ~ ~ 0.07 0.5
execute at @e[type=tnt,tag=laser] run particle minecraft:smoke ~ ~ ~ 20 20 20 0.1 10

execute as @e[tag=laser,type=tnt] at @s if entity @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~ ~ 0.5 0.5 0.5 0.1 150
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 10
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,tag=!power_owner,type=!#minecraft:arrows,distance=..20,limit=1,sort=nearest] run damage @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] 7
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] run particle minecraft:damage_indicator ~ ~0.5 ~ 0.5 0.5 0.5 0.1 11
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,distance=..20,limit=1,sort=nearest] run effect give @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] minecraft:glowing 1 1 true
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] run playsound minecraft:entity.elder_guardian.curse player @a ~ ~ ~ 0.3 0.8
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,distance=..20,limit=1,sort=nearest] run effect give @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] minecraft:blindness 2 3
execute as @e[tag=laser,type=tnt] at @s run execute at @e[type=!tnt,type=!area_effect_cloud,type=!minecraft:wither_skull,type=!minecraft:trident,tag=!power_owner,type=!#minecraft:arrows,tag=!target,distance=..20,limit=1,sort=nearest] run particle minecraft:enchant ~ ~0.5 ~ 0.5 0.5 0.5 0.1 100

#Shard of Sonic (DONE WORK) (FITUR COOLDOWN MATI)
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.5 0.5 0.5 0.1 200
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:dust{color:[0.0,1.0,1.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 120
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:sculk_charge_pop ~ ~0.5 ~ 0.5 0.5 0.5 0.1 100
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:sculk_charge{roll:0.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 100
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run summon minecraft:armor_stand ^ ^ ^1 {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["echo"],Rotation:[0f,1f]}
execute as @e[tag=echo] positioned ~ ~ ~ at @s run tp @s ~ ~ ~ facing entity @a[tag=power_owner,limit=1,sort=nearest]
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run playsound minecraft:entity.warden.sonic_boom player @a[distance=..26] ~ ~ ~ 1.5 1 0.3
execute at @e[type=item,name="Echo Shard"] run execute at @p[tag=power_owner,distance=..3] run kill @e[type=item,name="Echo Shard",distance=..3,limit=1]

execute as @e[tag=echo] at @s run tp @s[tag=echo] ^ ^ ^-3
execute at @e[tag=echo] run execute at @p[tag=power_owner] run kill @e[tag=echo,distance=26..]
execute at @e[tag=echo] run particle minecraft:sonic_boom ~ ~1.5 ~
execute at @e[tag=echo] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..3.3,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run damage @s 11 minecraft:sonic_boom by @p[tag=power_owner]
execute at @e[tag=echo] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..3.3,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:glowing 1 1 true
execute at @e[tag=echo] run particle minecraft:sculk_charge_pop ~ ~1.5 ~ 0.2 0.2 0.2 0.1 10
execute at @e[tag=echo] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..3.3,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run tag @s add sonicate

execute at @e[type=item,name="Echo Shard"] if entity @e[tag=echo] run kill @e[type=item,name="Echo Shard"]

#Fireball Core (DONE WORK)
execute at @e[type=item,name="Fire Charge"] run execute as @p at @s run execute at @s positioned ~ ~1.5 ~ run particle minecraft:flame ^ ^ ^2 0.5 0.5 0.5 0.1 200
execute at @e[type=item,name="Fire Charge"] run execute as @p at @s run execute at @s positioned ~ ~1 ~ run summon minecraft:fireball ^ ^ ^2 {ExplosionPower:3,Tags:["moving_fireball"]}
kill @e[type=item,name="Fire Charge"]

execute at @p run kill @e[tag=moving_fireball,distance=126..]
execute at @e[tag=moving_fireball] run particle minecraft:dust{color:[1.0,0.3,0.0],scale:1.0} ~ ~ ~ 0.2 0.2 0.2 0.1 26

#Bomb Core (DONE WORK)
execute as @e[type=item,name="Creeper Head"] at @p at @s run execute at @s run execute at @s positioned ~ ~1.5 ~ run particle minecraft:dust{color:[1.0,0.1,0.0],scale:1.0} ~ ~ ~ 0.5 0.5 0.5 0.1 200
execute as @e[type=item,name="Creeper Head"] run execute at @p at @s run execute at @s positioned ~ ~1 ~ run summon minecraft:tnt ~ ~ ~ {explosion_power:3.7,fuse:30,Tags:["creeper_tnt"],block_state:{Name:"minecraft:air"}}
execute as @e[type=item,name="Creeper Head"] at @s run playsound minecraft:block.note_block.imitate.creeper player @a[distance=..10] ~ ~ ~ 2 0.5 0.6
execute at @e[type=item,name="Creeper Head"] run effect give @p[tag=power_owner] minecraft:absorption 2 6
kill @e[type=item,name="Creeper Head"]

execute at @e[tag=creeper_tnt] run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.1 60
execute as @e[tag=creeper_tnt] at @s run tp @s @p

#Blast Curse (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:nether_star at @s run particle minecraft:reverse_portal ~ ~0.5 ~ 0.5 0.5 0.5 0.1 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:nether_star at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.6 0.6 0.6 0.05 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:nether_star at @s run particle minecraft:dust{color:[1.0,0.8,0.0],scale:1.0} ~ ~0.5 ~ 0.3 0.3 0.3 0.05 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:nether_star at @s run execute at @e[type=!minecraft:evoker_fangs,tag=!power_owner,distance=..11] run summon minecraft:tnt ~ ~1 ~ {fuse:1,explosion_power:0.6}
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:nether_star at @s run execute as @e[type=!minecraft:evoker_fangs,tag=!power_owner,distance=..11] at @s run effect give @s minecraft:glowing 1 1 true

#Crossboom (DONE WORK)
execute at @e[tag=arrow_boom,nbt={inGround:1b}] run summon tnt ~ ~ ~ {fuse:1,explosion_power:2}
execute as @e[tag=arrow_boom,nbt={inGround:1b}] at @s run kill @s

execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:crossbow at @s run execute at @s run tag @e[type=arrow,distance=..2.6] add arrow_boom
execute at @e[tag=arrow_boom] run particle minecraft:sonic_boom ~ ~ ~
execute at @e[tag=arrow_boom] run playsound minecraft:entity.warden.sonic_boom player @a[distance=..10] ~ ~ ~ 1 1 0.2
execute at @e[tag=arrow_boom] run damage @e[tag=!power_owner,type=!minecraft:trident,distance=..3,limit=1] 7 minecraft:player_attack by @p[tag=power_owner]
execute at @e[tag=arrow_boom] run particle minecraft:soul_fire_flame ~ ~ ~ 0.1 0.1 0.1 0.1 10


# = TIER 3 =
#Stormbringer (DONE WORK)
execute at @e[type=minecraft:trident,tag=stormbringer] run particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.5 20
execute at @e[type=minecraft:trident,tag=stormbringer] run execute at @e[tag=!power_owner,distance=..10,tag=!struck,tag=!ritual,tag=!domain] run summon tnt ~ ~ ~ {fuse:1,explosion_power:1.5}
execute at @e[type=minecraft:trident,tag=stormbringer] run execute at @e[tag=!power_owner,distance=..10,tag=!struck,tag=!ritual,tag=!domain] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[type=minecraft:trident,tag=stormbringer] run tag @e[tag=!power_owner,tag=!struck,distance=..10] add struck
execute at @e[type=minecraft:trident,tag=stormbringer] run effect give @p[tag=power_owner] minecraft:resistance 1
execute at @e[type=trident] run execute at @p[tag=power_owner] run tag @e[type=trident,distance=..2] add stormbringer

#Voidseer (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run particle minecraft:portal ^ ^0.5 ^10 2.0 1.0 2.0 0.15 350
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run particle minecraft:dragon_breath ^ ^0.5 ^10 1.5 0.8 1.5 0.08 250
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run particle minecraft:flame ^ ^0.5 ^10 1.0 0.5 1.0 0.03 180
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run playsound minecraft:block.portal.ambient player @a ~ ~ ~ 0.5 0.8
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run tp @e[tag=!power_owner,tag=!ritual,tag=!domain,tag=!laser,tag=!awaken,tag=!awaken_duration,distance=..15] ^ ^0.5 ^10
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run effect give @e[tag=!power_owner,tag=!ritual,distance=..15] minecraft:blindness 3 11
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run effect give @e[tag=!power_owner,tag=!ritual,distance=..15] minecraft:weakness 3 2
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:blaze_rod at @s positioned ^ ^0.5 ^10 run execute at @e[tag=!power_owner,tag=!ritual,tag=!domain,tag=!laser,tag=!awaken,tag=!awaken_duration,distance=..15] run effect give @s minecraft:resistance 3 2

execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:blaze_rod at @s run effect give @e[tag=!power_owner,distance=..26] minecraft:glowing 1 1

#Lovely Poppy (DONE WORK)
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run particle minecraft:heart ~ ~ ~ 0.5 0.5 0.5 0.1 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run particle minecraft:cherry_leaves ~ ~0.3 ~ 0.5 0.5 0.5 0.1 15
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run particle minecraft:glow ~ ~2.6 ~ 0.4 0.4 0.4 0.1 15
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run effect give @s minecraft:regeneration 11 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run effect give @e[tag=!power_owner,distance=..26] minecraft:glowing 11 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run effect give @e[tag=!power_owner,distance=..26] minecraft:weakness 11 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.mainhand minecraft:poppy at @s run tag @e[tag=!power_owner,distance=..5] add love

execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run particle minecraft:heart ~ ~ ~ 0.5 0.5 0.5 0.1 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run effect give @s minecraft:regeneration 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run effect give @s minecraft:breath_of_the_nautilus 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run effect give @s minecraft:fire_resistance 1 3
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run effect give @s minecraft:strength 1
execute as @a[tag=power_owner] at @s if items entity @s weapon.offhand minecraft:poppy at @s run effect give @s minecraft:haste 1 15

#Death Beam (V2 FORM) (DONE WORK) (FITUR COOLDOWN MATI)
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:explosion ~ ~0.5 ~ 1 1 1 0.1 15
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 126
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:flame ~ ~0.5 ~ 0.5 0.5 0.5 0.1 126
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 126
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run summon minecraft:armor_stand ^ ^ ^1 {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["beam"],Rotation:[0f,1f]}
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run playsound minecraft:entity.warden.sonic_boom player @a[distance=..26] ~ ~ ~ 1.75 0.8 0.4
execute at @e[type=item,name="Redstone Dust"] run execute at @p[tag=power_owner,distance=..3] run kill @e[type=item,name="Redstone Dust",distance=..3,limit=1]
execute as @e[tag=beam] positioned ~ ~ ~ at @s run tp @s ~ ~ ~ facing entity @a[tag=power_owner,limit=1,sort=nearest]

execute as @e[tag=beam] at @s run tp @s[tag=beam] ^ ^ ^-5
execute at @e[tag=beam] run execute at @p[tag=power_owner] run kill @e[tag=beam,distance=152..]
execute at @e[tag=beam] run particle minecraft:explosion ~ ~1.5 ~
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run damage @s 15 minecraft:sonic_boom by @p[tag=power_owner]
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:glowing 1 1 true
execute at @e[tag=beam] run particle minecraft:dust{color:[1.0,0.3,0.0],scale:1.0} ~ ~1.5 ~ 0.4 0.4 0.4 0.1 260
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:hunger 15 1
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:weakness 15 1
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:slowness 15
execute at @e[tag=beam] positioned ~ ~ ~ run execute as @e[tag=!power_owner,distance=..4.5,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] at @s run effect give @s minecraft:mining_fatigue 15


# = TIER 4 =
#Ritual of Blast (DONE WORK)
execute at @e[type=minecraft:mule,tag=target] run summon tnt ~ ~26 ~ {fuse:200,explosion_power:15,Tags:["ritual"]}
execute at @e[type=minecraft:mule,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:slow_falling 15 15
execute at @e[type=minecraft:mule,tag=target] run effect give @e[distance=..100] minecraft:darkness 11 200
execute at @e[type=minecraft:mule,tag=target] run tellraw @a [  {"text":"(RITUAL) ","color":"dark_purple","bold":true},  {"text":"","color":"gold"},  {"text":"With this fuse and fury, I unleash the end. By the spark of destruction... I summon the...","color":"blue","bold":false},  {"text":"\n","color":"blue"},  {"text":"AWAKENING BLAST!","color":"red","bold":true}]
execute at @e[type=minecraft:mule,tag=target] run playsound minecraft:block.end_portal.spawn player @a ~ ~ ~ 0.8 1 1
execute at @e[type=minecraft:mule,tag=target] run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 1 0.6 1
execute at @e[type=minecraft:mule,tag=target] run playsound minecraft:entity.evoker.prepare_summon player @a ~ ~ ~ 1 1.2 1
execute at @e[type=minecraft:mule,tag=target] run playsound minecraft:entity.ender_dragon.growl player @a ~ ~ ~ 0.8 0.5 1
kill @e[type=minecraft:mule,tag=target]

execute at @e[type=tnt,tag=ritual] positioned ~7 ~ ~ run tp @p[tag=power_owner] ~ ~ ~
execute at @e[type=tnt,tag=ritual] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:resistance 1 26
execute at @e[type=tnt,tag=ritual] run particle lava ~ ~ ~
execute at @e[type=tnt,tag=ritual] run tp @e[type=tnt,tag=ritual] @e[type=tnt,tag=ritual,limit=1]
execute as @e[type=tnt,tag=ritual] run execute as @p[tag=power_owner] at @s run fill ~ ~-1 ~ ~ ~-1 ~ minecraft:black_concrete
execute at @e[type=tnt,tag=ritual] run fill ~ ~-1 ~ ~ ~-2 ~ minecraft:black_concrete
execute as @e[tag=ritual,type=tnt] at @s if block ~ ~-0.3 ~ air run tp @s ~ ~0.01 ~

execute at @e[type=tnt,tag=ritual] positioned ~-1 ~ ~ run tp @e[tag=!power_owner,tag=!ritual,distance=..78,type=!minecraft:fishing_bobber] ~ ~ ~

#Oblivion Chamber (DONE WORK)
execute at @e[type=minecraft:shulker,tag=target] run summon tnt ~ 200 ~ {fuse:400,explosion_power:33,Tags:["domain"],block_state:{Name:"minecraft:magma_block"}}
execute at @e[type=minecraft:shulker,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:resistance 25 5
execute at @e[type=minecraft:shulker,tag=target] run playsound minecraft:block.end_portal.spawn player @a ~ ~ ~ 1 0.9
execute at @e[type=minecraft:shulker,tag=target] run tellraw @a [  {"text":"(DOMAIN) ","color":"red","bold":true},  {"text":"","color":"gold"},  {"text":"Within these walls, no light escapes... only destruction awaits.","color":"dark_red","bold":false}]
execute at @e[type=minecraft:shulker,tag=target] run playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 1 0.8
execute as @e[type=minecraft:shulker,tag=target] run execute as @p[tag=power_owner] at @s run effect give @e[distance=..10] minecraft:mining_fatigue 3 3
execute as @e[type=minecraft:shulker,tag=target] run execute as @p[tag=power_owner] at @s run effect give @e[distance=..10] minecraft:blindness 3
execute as @e[type=minecraft:shulker,tag=target] run execute as @p[tag=power_owner] at @s run effect give @e[distance=..10] minecraft:darkness 21
execute as @e[type=minecraft:shulker,tag=target] run execute as @p[tag=power_owner] at @s run tp @e[tag=!power_owner,tag=!domain,tag=!ritual,distance=..10] @e[tag=domain,limit=1]
execute at @e[type=minecraft:shulker,tag=target] run tp @p[tag=power_owner] ~-3 ~ ~
execute as @e[tag=domain,type=tnt] at @s if block ~ ~-0.3 ~ air run tp @s ~ ~0.02 ~
kill @e[type=minecraft:shulker,tag=target]

execute at @e[type=tnt,tag=domain] run fill ~7 ~-2 ~7 ~-7 ~-2 ~-7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~-7 ~-2 ~-7 ~-7 ~4 ~7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~7 ~-2 ~-7 ~7 ~4 ~7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~-7 ~-2 ~-7 ~7 ~4 ~-7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~-7 ~-2 ~7 ~7 ~4 ~7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~7 ~5 ~7 ~-7 ~5 ~-7 minecraft:black_wool
execute at @e[type=tnt,tag=domain] run fill ~ ~-1 ~ ~ ~-1 ~ minecraft:black_wool
execute at @e[type=tnt,tag=domain] run tp @e[type=tnt,tag=domain] @e[type=tnt,tag=domain,limit=1]
execute at @e[type=tnt,tag=domain] run playsound minecraft:block.soul_sand.step player @a ~ ~ ~ 0.3 0.5
execute at @e[type=tnt,tag=domain] run particle minecraft:ash ~ ~ ~ 7 7 7 0.3 50
execute at @e[type=tnt,tag=domain] run particle minecraft:smoke ~ ~ ~ 7 7 7 0.02 60
execute at @e[type=tnt,tag=domain] run particle minecraft:reverse_portal ~ ~ ~ 7 7 7 0.1 15
execute at @e[type=tnt,tag=domain] run particle minecraft:flame ~ ~ ~ 7 7 7 0.1 26

#Hellfire (DONE WORK)
execute at @e[type=item,name="Flint and Steel"] run execute at @p[tag=power_owner,distance=..3] run particle minecraft:flame ~ ~0.5 ~ 0.5 0.5 0.5 0.1 200
execute at @e[type=item,name="Flint and Steel"] run execute at @p[tag=power_owner,distance=..3] run summon minecraft:armor_stand ^ ^ ^1 {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["flame_shot"],Rotation:[0f,1f]}
execute at @e[type=item,name="Flint and Steel"] run execute at @p[tag=power_owner,distance=..3] run playsound minecraft:entity.blaze.shoot player @a[distance=..26] ~ ~ ~ 1.5 0.8 0.3
execute at @e[type=item,name="Flint and Steel"] run execute at @p[tag=power_owner,distance=..3] run kill @e[type=item,name="Flint and Steel",distance=..3,limit=1]
execute as @e[tag=flame_shot] positioned ~ ~ ~ at @s run tp @s ~ ~ ~ facing entity @a[tag=power_owner,limit=1,sort=nearest]

execute at @e[tag=flame_shot] run tp @e[tag=flame_shot] ^ ^ ^-3
execute at @p[tag=power_owner] run kill @e[tag=flame_shot,distance=37..]
execute at @e[tag=flame_shot] run particle minecraft:flame ~ ~1.5 ~ 0.1 0.1 0.1 0.1 15
execute at @e[tag=flame_shot] positioned ~ ~-0.5 ~ run tag @e[tag=!power_owner,tag=!flame_shot,limit=1,distance=..4,type=!#minecraft:arrows,type=!minecraft:area_effect_cloud,type=!minecraft:trident] add target_flame
execute at @e[tag=flame_shot] if entity @e[tag=target_flame] run kill @e[tag=flame_shot]

execute at @e[type=item,name="Flint and Steel"] if entity @e[tag=flame_shot] run kill @e[type=item,name="Flint and Steel"]
execute at @e[tag=flame_spin] unless entity @e[tag=flame_duration] run kill @e[tag=flame_spin]
execute as @e[tag=flame_spin] at @s run tp @s ~ ~ ~ ~26 ~
execute at @e[tag=flame_spin] positioned ^ ^ ^3 run particle lava ~ ~20 ~ 0.2 10 0.2 1 450
execute at @e[tag=flame_spin] positioned ^ ^ ^-5 run particle lava ~ ~20 ~ 0.2 10 0.2 0.1 200
execute at @e[tag=flame_spin] positioned ^ ^ ^-1 run particle minecraft:campfire_cosy_smoke ~ ~20 ~ 0.2 10 0.2 0.3 300
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:lava ^ ^ ^6 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^1 ^ ^8 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^2 ^ ^10 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^3 ^ ^12 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^4 ^ ^14 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^5 ^ ^16 0.1 1.5 0.1 0.1 50
execute as @e[tag=flame_spin] at @s anchored eyes run particle minecraft:flame ^6 ^ ^18 0.1 1.5 0.1 0.1 50
execute at @e[tag=flame_spin] positioned ~ ~ ~ run particle smoke ~ ~20 ~ 10 10 10 0.1 400
execute at @e[tag=flame_spin] positioned ~ ~ ~ run playsound minecraft:entity.blaze.ambient player @a[distance=..85] ~ ~ ~ 2 1.3 0.5
execute at @e[tag=flame_spin] positioned ~ ~3 ~ run execute as @e[distance=..10,tag=!power_owner] at @s run damage @s 8 minecraft:generic by @p[tag=power_owner]
execute at @e[tag=flame_spin] positioned ~ ~10 ~ run execute as @e[distance=..26,tag=!power_owner] at @s run data modify entity @s Fire set value 300
execute at @e[tag=flame_spin] positioned ~ ~3 ~ run fill ~-4 ~-4 ~-4 ~4 ~4 ~4 fire replace air
execute at @e[tag=flame_spin] positioned ~ ~3 ~ run effect give @e[tag=power_owner,distance=..35] minecraft:fire_resistance 1 3
execute at @e[tag=flame_spin] positioned ~ ~3 ~ run execute as @e[distance=..11,tag=!power_owner] at @s run tag @s add blaze
execute at @e[tag=flame_spin] positioned ~ ~3 ~ run execute as @e[distance=..18,tag=!power_owner] at @s run damage @s 3 minecraft:generic by @p[tag=power_owner]

execute at @e[tag=target_flame] run summon tnt ~ ~ ~ {explosion_power:0.1,fuse:200,Tags:["flame_duration"],block_state:{Name:"minecraft:air"}}
execute at @e[tag=target_flame] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["flame_spin"],Rotation:[0f,0f]}
execute at @e[tag=target_flame] run playsound minecraft:entity.generic.explode player @a[distance=..30] ~ ~ ~ 3 0.9 0.5
tag @e[tag=target_flame] remove target_flame


# = TIER 5 =
#Awakening (DONE WORK)
execute as @e[type=tnt,tag=awaken_duration] run kill @e[type=zombie_horse,tag=target]
execute at @e[type=minecraft:zombie_horse,tag=target] run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["awaken"],Rotation:[0f,0f]}
execute at @e[type=minecraft:zombie_horse,tag=target] run summon minecraft:tnt ~ ~ ~ {fuse:200,explosion_power:4,Tags:["awaken"],block_state:{Name:"minecraft:air"}}
execute at @e[type=minecraft:zombie_horse,tag=target] run playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 2 1.2
execute at @e[type=minecraft:zombie_horse,tag=target] run playsound minecraft:block.end_portal.spawn player @a ~ ~ ~ 1 0.7
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:darkness 11
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:strength 70 3
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:regeneration 70 11
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:speed 70 1
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:fire_resistance 70 3
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:haste 70 26
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:jump_boost 70 3
execute at @e[type=minecraft:zombie_horse,tag=target] run execute as @p[tag=power_owner] at @s run effect give @s minecraft:resistance 11 255
execute at @e[type=minecraft:zombie_horse,tag=target] run summon minecraft:tnt ~ ~ ~ {fuse:1400,explosion_power:0.1,Tags:["awaken_duration"],block_state:{Name:"minecraft:air"}}
execute at @e[type=minecraft:zombie_horse,tag=target] run tellraw @a [  {"text":"(AWAKENING) ","color":"dark_red","bold":true},  {"text":"","color":"gold"},  {"text":"With this awakening, ","color":"dark_purple","bold":false},{"text":"I WILL DESTROY YOU ALL...","color":"dark_red","bold":false}]
execute as @e[type=tnt,tag=awaken_duration] run clear @p[tag=power_owner] minecraft:zombie_horse_spawn_egg
kill @e[type=minecraft:zombie_horse,tag=target]

execute as @e[tag=awaken] at @s run tp @s ~ ~ ~ ~30.2 ~
execute at @e[type=minecraft:armor_stand,tag=awaken] positioned ^ ^ ^10 run particle minecraft:wax_on ~ ~ ~ 0 50 0 0 1000
execute at @e[type=minecraft:armor_stand,tag=awaken] positioned ^ ^ ^10 run particle minecraft:electric_spark ~ ~ ~ 0 50 0 1 2000
execute at @e[type=minecraft:armor_stand,tag=awaken] positioned ^ ^ ^10 run particle minecraft:flame ~ ~ ~ 1 50 1 0.1 1000
execute at @e[type=armor_stand,tag=awaken,limit=1] run tp @p[tag=power_owner] ~ ~ ~
execute at @e[type=minecraft:armor_stand,tag=awaken] run particle minecraft:smoke ~ ~ ~ 10 50 10 0.1 10000

execute unless entity @e[type=tnt,tag=awaken] run kill @e[type=armor_stand,tag=awaken]
execute at @e[type=tnt,tag=awaken_duration] run execute as @p[tag=power_owner] at @s run particle flame ~ ~1 ~ 1 1 1 0.1 11
execute as @e[type=tnt,tag=awaken_duration] run execute as @p[tag=power_owner] at @s run effect give @e[tag=!power_owner,distance=..15] minecraft:glowing 1 1
execute as @e[type=tnt,tag=awaken_duration] run execute as @p[tag=power_owner] at @s run execute as @e[nbt={HurtTime:10s},distance=..11] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[type=tnt,tag=awaken_duration] at @p[tag=power_owner] run tp @e[type=tnt,tag=awaken_duration,limit=1,sort=nearest] @p[tag=power_owner]

execute as @e[type=tnt,tag=awaken] at @s run advancement grant @p[tag=power_owner] only hl_powers:awakened


# === PERMANENT EFFECT ===
# = Struck =
execute at @e[tag=struck,tag=!power_owner] run particle minecraft:electric_spark ~ ~0.5 ~ 0.5 0.5 0.5 1 11
execute at @e[tag=struck,tag=!power_owner] run particle minecraft:firework ~ ~1 ~ 0 0 0 0.1 1
execute at @e[tag=struck,tag=!power_owner] run particle minecraft:wax_off ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute at @e[tag=struck,tag=!power_owner] run effect give @e[tag=struck,tag=!power_owner] minecraft:weakness 2

# = Curse =
execute at @e[tag=curse,tag=!power_owner] run particle minecraft:witch ~ ~0.5 ~ 0.2 0.2 0.2 0.1 5
execute at @e[tag=curse,tag=!power_owner] run particle minecraft:soul ~ ~0.5 ~ 0 0 0 0.1 2
execute at @e[tag=curse,tag=!power_owner] run particle minecraft:enchant ~ ~1 ~ 0.7 0.7 0.7 0.2 5
execute at @e[tag=curse,tag=!power_owner] run effect give @e[tag=curse,tag=!power_owner] minecraft:wither 2
execute at @e[tag=curse,tag=!power_owner] run effect give @e[tag=curse,tag=!power_owner] minecraft:poison 2 1

# = Frost =
execute at @e[tag=frost,tag=!power_owner] run particle minecraft:snowflake ~ ~0.5 ~ 0 0 0 0.1 3
execute at @e[tag=frost,tag=!power_owner] run particle minecraft:end_rod ~ ~0.5 ~ 0 0 0 0.1 1
execute at @e[tag=frost,tag=!power_owner] run effect give @e[tag=frost,tag=!power_owner] minecraft:slowness 2 2
execute at @e[tag=frost,tag=!power_owner] run effect give @e[tag=frost,tag=!power_owner] minecraft:mining_fatigue 2

# = Love =
execute at @e[tag=love,tag=!power_owner] run particle minecraft:heart ~ ~0.5 ~ 0.5 0.5 0.5 0.1 1
execute at @e[tag=love,tag=!power_owner] run particle minecraft:cherry_leaves ~ ~0.5 ~ 0.5 0.5 0.5 0.1 1
execute at @e[tag=love,tag=!power_owner] run effect give @e[tag=love,tag=!power_owner] minecraft:glowing 2
execute at @e[tag=love,tag=!power_owner] run effect give @e[tag=love,tag=!power_owner] minecraft:weakness 2

# = Sonicate =
execute at @e[tag=sonicate,tag=!power_owner,tag=!echo] run particle minecraft:sculk_soul ~ ~0.5 ~ 0.5 0.5 0.5 0.05 1
execute at @e[tag=sonicate,tag=!power_owner,tag=!echo] run particle minecraft:sculk_charge_pop ~ ~0.5 ~ 0.5 0.5 0.5 0.05 3
execute at @e[tag=sonicate,tag=!power_owner] run effect give @e[tag=sonicate,tag=!power_owner] minecraft:weakness 2
execute at @e[tag=sonicate,tag=!power_owner] run effect give @e[tag=sonicate,tag=!power_owner] minecraft:mining_fatigue 2

# = Blaze =
execute at @e[tag=blaze,tag=!power_owner] run particle minecraft:flame ~ ~0.5 ~ 0.5 0.5 0.5 0.05 2
execute at @e[tag=blaze,tag=!power_owner] run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0.1 1
execute at @e[tag=blaze,tag=!power_owner] run particle minecraft:smoke ~ ~0.5 ~ 0.5 0.5 0.5 0.05 3
execute at @e[tag=blaze,tag=!power_owner] run effect give @e[tag=blaze,tag=!power_owner] minecraft:weakness 2
execute at @e[tag=blaze,tag=!power_owner] run effect give @e[tag=blaze,tag=!power_owner] minecraft:hunger 2
execute at @e[tag=blaze,tag=!power_owner] run effect give @e[tag=blaze,tag=!power_owner] minecraft:glowing 2
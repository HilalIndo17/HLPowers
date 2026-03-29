# Help function
# ===== HELP FUNCTION =====
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
tellraw @s [{"text":"✨ ","color":"light_purple","bold":true},{"text":"HLPowers - HELP - Page 3","color":"gold","bold":true},{"text":" ✨","color":"light_purple","bold":true}]
tellraw @s [{"text":"-How to execute powers: ","color":"green","bold":true},{"text":"Powers can be executed through items (item drops), mobs, or by holding specific items, each with its own unique power.","color":"dark_green","bold":false}]
#tellraw @s [{"text":"-Activating power from mob: ","color":"green","bold":true},{"text":"Some powers from mob are activated when the player holds redstone dust in their offhand while near the mob.","color":"dark_green","bold":false}]
#tellraw @s [{"text":"-Note: ","color":"light_purple","bold":true},{"text":"Some powers have two modes (such as mainhand/offhand) and others have only one mode (such as mainhand or offhand only).","color":"dark_purple","bold":false}]
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s

# Help function
# ===== HELP FUNCTION =====
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
tellraw @s [{"text":"✨ ","color":"light_purple","bold":true},{"text":"HLPowers - HELP - Page 2","color":"gold","bold":true},{"text":" ✨","color":"light_purple","bold":true}]
#tellraw @s [{"text":"-How to gain & lose access to powers: ","color":"green","bold":true},{"text":"Use the commands '/function hl_powers:power/enable' & '/function hl_powers:power/disable'.","color":"dark_green","bold":false}]
tellraw @s [{"text":"-Activating power from mob: ","color":"green","bold":true},{"text":"Some powers from mob are activated when the player holds redstone dust in their offhand while near the mob.","color":"dark_green","bold":false}]
tellraw @s [{"text":"-Note: ","color":"light_purple","bold":true},{"text":"Some powers have two modes (such as mainhand/offhand) and others have only one mode (such as mainhand or offhand only).","color":"dark_purple","bold":false}]
tellraw @s [{"text":"==============================","color":"gray","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s

extends Node

var player_health: float = clamp(3, -3, 5) #Health of player
var player_shield: int = clamp(0, -3, 3)
var prev_health: float
var prev_shield: int
var canTakeDamage: bool = true  #Prevents repeated damage without cooldown
@export var damage_cooldown: float = 1.0  #Cooldown time in seconds

func _ready() -> void: 
	pass

func take_damage(amount: float): #Is called when the player takes damage
	if canTakeDamage: #If the player can currently take damage
		if(player_shield >= 1):
			prev_shield = player_shield
			player_shield -= 1
			print("Player took damage! Health:", player_health)
			canTakeDamage = false  #Disables current damage
			await get_tree().create_timer(damage_cooldown).timeout  #Wait for cooldown
			canTakeDamage = true  #Allows damage again
		else:
			# handle camera shake
			prev_health = player_health
			player_health -= amount #Lowers health from damage passed through
			print("Player took damage! Health:", player_health)
			canTakeDamage = false  #Disables current damage
			await get_tree().create_timer(damage_cooldown).timeout  #Wait for cooldown
			canTakeDamage = true  #Allows damage again

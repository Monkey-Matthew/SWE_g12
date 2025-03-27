extends Node

var player_health: float = 3 #Health of player
var canTakeDamage: bool = true  #Prevents repeated damage without cooldown
@export var damage_cooldown: float = 1.0  #Cooldown time in seconds

func _ready() -> void: 
	pass
	
func take_damage(amount: float): #Is called when the player takes damage
	if canTakeDamage: #If the player can currently take damage
		# handle camera shake
		player_health -= amount #Lowers health from damage passed through
		print("Player took damage! Health:", player_health)
		canTakeDamage = false  #Disables current damage
		await get_tree().create_timer(damage_cooldown).timeout  #Wait for cooldown
		canTakeDamage = true  #Allows damage again

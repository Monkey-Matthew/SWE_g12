extends Node

var player_health: float = 3
var canTakeDamage: bool = true  # Prevents immediate repeated damage
@export var damage_cooldown: float = 1.0  # Cooldown time in seconds

func take_damage(amount: float):
	if canTakeDamage:
		player_health -= amount
		print("Player took damage! Health:", player_health)
		canTakeDamage = false  # Prevent further damage
		await get_tree().create_timer(damage_cooldown).timeout  # Wait for cooldown
		canTakeDamage = true  # Allow damage again

func _ready() -> void:
	print("Player health initialized:", player_health)

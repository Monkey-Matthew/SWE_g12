extends Area2D

@export var damageAmount: float
var playerInside: bool = false

func _process(delta: float) -> void:
	if playerInside == true:
		Health.player_health -= damageAmount
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not body.invulnerable:
		playerInside = true
		# playerDied = true  I suspect we may need this later.
		pass
	else:
		#print("Player is invulnerable!") # For testing. Will spam console.
		pass # Nothing happens if they're invulnerable.

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		playerInside = false

extends Area2D

@export var damage_amount: float #Variable that stores the amount of damage the area takes
var playerInside: bool = false #Variable that checks if the player is inside of the area or not

func _process(delta: float) -> void:
	if playerInside == true: #If the player is in the area; make the player take damage.
		Health.take_damage(damage_amount)
		
func _on_area_2d_body_entered(body: Node2D) -> void: #If player entered the area
	if body.name == "Player" and not body.invulnerable:
		playerInside = true
		pass
	else:
		#print("Player is invulnerable!") # For testing. Will spam console.
		pass # Nothing happens if they're invulnerable.

func _on_area_2d_body_exited(body: Node2D) -> void: #When the player exits the area
	if body.name == "Player":
		playerInside = false

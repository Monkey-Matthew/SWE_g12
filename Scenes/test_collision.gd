extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass #Just skips this function for now (Can update if we need to)

func _on_area_2d_body_entered(body: Node2D) -> void: #Signal that determines if a body enters the 2d area
	if body.is_in_group("player"): # Chcecks to see if the body that was entered is in the group player
		print("Player died") #Update later

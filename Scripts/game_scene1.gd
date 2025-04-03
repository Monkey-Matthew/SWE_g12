extends Node2D

@onready var player = $Player

func _ready():
	if(PlayerLocation.player_position != Vector2.ZERO):
		player.position = PlayerLocation.player_position
		PlayerLocation.player_position = Vector2.ZERO
	PlayerLocation.set_current_scene(self)  # Store scene file path
	PlayerLocation.update_player_position(player)  # Store player position
func _process(delta):
	PlayerLocation.update_player_position(player)  # Continuously update player position
	

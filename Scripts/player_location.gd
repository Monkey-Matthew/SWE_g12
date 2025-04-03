extends Node

var current_scene: String = ""  # Store scene path as a string
var player_position: Vector2 = Vector2.ZERO

func set_current_scene(scene):
	if scene and scene.scene_file_path:  # Ensure the scene has a file path
		current_scene = scene.scene_file_path
		print("Stored current scene:", current_scene)  # Debugging

func update_player_position(player):
	if player:
		player_position = player.position

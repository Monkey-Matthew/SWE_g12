extends TextureRect


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Returning to scene:", PlayerLocation.current_scene)  # Debugging
		if PlayerLocation.current_scene != "":
			get_tree().change_scene_to_file(PlayerLocation.current_scene)
		else:
			print("Error: No previous scene stored!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

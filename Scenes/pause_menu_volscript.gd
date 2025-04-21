extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var music_player = get_node("/root/GameScene/AudioStreamPlayer")
	print(music_player)
	$VBoxContainer/VolumeSlider.value = music_player.volume_db

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_slider_value_changed(value: float) -> void:
	var music_player = get_node("/root/GameScene/AudioStreamPlayer")
	if value <= -39:
		music_player.volume_db = -100
	else:
		music_player.volume_db = value

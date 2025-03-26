extends StaticBody2D

var coin = preload("res://Scenes/coin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("destructables") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_coins() -> void:
	for i in range(3):
		var coin_instance = coin.instantiate()
		coin_instance.position = position + Vector2(randf_range(-10, 10), randf_range(-10, 10)) # So they don't spawn on top of each other.
		get_parent().add_child(coin_instance)

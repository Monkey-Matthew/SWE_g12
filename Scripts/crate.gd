extends StaticBody2D

var coin = preload("res://Scenes/coin.tscn")
var randomCoin : int
var rng = randf_range(0,4)

var key = preload("res://Scenes/key.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("destructables") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_coins() -> void:
	for i in range(rng): # Random amount of coins, 1-3
		var coin_instance = coin.instantiate()
		coin_instance.position = position + Vector2(randf_range(-10, 10), randf_range(-10, 10)) # So they don't spawn on top of each other.
		get_parent().add_child(coin_instance)
		
		# Potential to spawn a key.
		var drop_chance = .05    # 5% chance a key will drop.
		if randf() < drop_chance and key_drop.crate_key_dropped == false: # Derrives from key_drop.gd. Ensures only one key ever spawns from a crate.
			var k = key.instantiate()
			k.position = position
			get_parent().add_child(k)
			key_drop.crate_key_dropped = true

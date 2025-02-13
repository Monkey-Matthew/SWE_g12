extends CharacterBody2D

@export var movement_speed: float = 1.0  # Movement speed of the firefly
@export var sizeOfPath: float = 5.0 # Size of the movement path

var time: float = 0.0  # Increased by movement_speed and delta
var startingPosition: Vector2

func _ready() -> void:
	startingPosition  = position
	time += movement_speed + (randf() * 100) 
	
func _process(delta: float) -> void:
	
	time += delta * movement_speed # This is the variable that controls the firefly on the infinity sign graph

	# Infinity graph movement
	var x = sizeOfPath * cos(time)
	var y = sizeOfPath * sin(time) * cos(time)
	

	position = startingPosition + Vector2(x, y) # Updates the fireflies position

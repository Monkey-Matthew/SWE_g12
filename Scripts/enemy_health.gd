extends Node

@export var max_health: int
var current_health: int
var parent_node: Node = get_parent()  # Reference to the parent node (CharacterBody2D)
@onready var sprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")

func _ready():
	current_health = max_health  # Initialize health when spawned
	parent_node = get_parent()  #References parent node

func take_damage(amount: int):
	current_health -= amount
	print(name, " took ", amount, " damage. Health left: ", current_health)
	
	tint_sprite_red()
	
	if current_health <= 0:
		die()
		
func tint_sprite_red():
	if sprite:
		sprite.modulate = Color(1, 0, 0)  # Apply  red tint

		# Creates timer
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 0.1  # Wait for 0.1 secondsd
		timer.one_shot = true
		timer.start()

		# Wait for the timer to complete
		await timer.timeout

	if sprite:
			sprite.modulate = Color(1, 1, 1)  #Reset to white
	
	if current_health <= 0:
			die()

func die():
	print(parent_node.name, " defeated!")
	parent_node.queue_free()

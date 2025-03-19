extends Node

@export var max_health: int #Max health that the enemy can have
var current_health: int #Current health the enemy has
var parent_node: Node = get_parent()  #Reference to the parent node (CharacterBody2D)
@onready var sprite: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D") #Reference to animated sprite

func _ready():
	current_health = max_health  #Initialize health when spawned
	parent_node = get_parent()  #References parent node

func take_damage(amount: int):
	current_health -= amount #Enemy loses health depending on the amount of damage that was called into the function
	print(name, " took ", amount, " damage. Health left: ", current_health) #Debug
	
	tint_sprite_red() #Calls tinting function
	
	if current_health <= 0: #If there health is or less call the die function
		die()
		
func tint_sprite_red(): #Tints the enemy sprites if they get hit
	if sprite:
		sprite.modulate = Color(1, 0, 0)  #Applies red tint

		#Creates timer
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 0.1  #Wait for 0.1 secondsd
		timer.one_shot = true
		timer.start()

		#Wait for the timer to complete
		await timer.timeout

	if sprite:
			sprite.modulate = Color(1, 1, 1)  #Reset to white

func die(): #When the enemy's health is at 0 or less this function deletes the enemy from the scene.
	print(parent_node.name, " defeated!")
	parent_node.queue_free()

extends CharacterBody2D

var SPEED = 15 #Movement Speed (Change to fit character movement)
@onready var animated_sprite = $AnimatedSprite2D
@export var sizeOfPath: float = 40.0
@onready var POV = $Point
@onready var target = $"../Player"
var projectile_direction: Vector2
var time: float = 0.0
var startingPosition: Vector2
var is_following_player: bool = false
@export var damage_amount = .5

@onready var main = get_tree().get_root().get_node("GameScene")
@onready var projectile = load("res://Scenes/bat_projectile.tscn")
func _ready() -> void:
	startingPosition  = position
	time += SPEED+ (randf() * 100)
	shoot()

func _process(delta: float) -> void:
	
	time += delta * SPEED 
	#follows the charcter
	if is_following_player and target:
		var direction =(target.position-position).normalized()
		projectile_direction = direction;
		velocity = direction * SPEED
		if abs(direction.x) > abs(direction.y):
			# Moving left or right
			if direction.x > 0:
				animated_sprite.play("Right")
				animated_sprite.flip_h = false  # Face right
			else:
				animated_sprite.play("Right")
				animated_sprite.flip_h = true   # Face left
		else:
			# Moving up or down
			if direction.y > 0:
				animated_sprite.play("Down")  # Play down animation
			else:
				animated_sprite.play("Up")    # Play up animation
	#Moves in the Square movement
	else:
		# Square Movement
		var x = 0.0
		var y = 0.0
		#Determines the start location
		var phase = int(time / sizeOfPath) % 4
		#How position of where on the location it spawn at.
		var progress = fposmod(time, sizeOfPath)
		if phase == 0:
			#Move Right
			x = progress
			y = 0
			animated_sprite.play("Right")
			animated_sprite.flip_h = false
			POV.rotation_degrees = 180
			POV.position.x = -2
			POV.position.y = -4
		
		elif phase == 1:
			#Move Down
			x = sizeOfPath
			y = progress
			animated_sprite.play("Down")
			POV.rotation_degrees = -90
			POV.position.x = 2
			POV.position.y = -4
		elif phase == 2:
		#Move left
			x = sizeOfPath - progress
			y = sizeOfPath
			animated_sprite.play("Right")
			animated_sprite.flip_h = true
			POV.rotation_degrees = 0
			POV.position.x = 2
			POV.position.y = 0
		elif phase == 3:
			#Move up
			x = 0
			y = sizeOfPath - progress
			animated_sprite.play("Up")
			POV.rotation_degrees = -270
			POV.position.x = -2

		position = startingPosition + Vector2(x, y) 
	move_and_slide()
	#print(Health.player_health)
	
	
func _on_point_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player entered POV");
		target = body
		is_following_player = true
		SPEED = 40

func _on_point_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Player exited POV");

func _on_body_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Health.take_damage(damage_amount)

func shoot():
	if projectile_direction == Vector2.ZERO:
		return  # Don't shoot if the bat isn't moving

	var instance = projectile.instantiate()
	instance.dir = projectile_direction  # Set the projectile's direction to the bat's direction (Vector2)
	instance.spawnPos = global_position  # Set the spawn position
	instance.spawnRot = rotation  # Optionally, if you need to set the rotation of the projectile
	main.add_child.call_deferred(instance)


func _on_projectile_cooldown_timeout():
	shoot()

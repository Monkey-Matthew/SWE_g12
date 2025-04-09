extends CharacterBody2D

#Variables------------------------------------------------------------------------------------------------------------------------
#Bat movement
var SPEED = 35 #Movement Speed (Change to fit character movement)
@export var sizeOfPath: float = 80.0 #Size of the path
var time: float = 0.0 #Used for random starting position on path
var is_following_player: bool = false #Checks if the bat is following player

#Refrences
@onready var animated_sprite = $AnimatedSprite2D #Reference to animated sprite
@onready var POV = $Point #The bat's point of view
@onready var target = $"../Player" #Target of who the rat is targetting
@onready var main = get_tree().get_root().get_node("GameScene") #Reference to GameScene
@onready var projectile = load("res://Scenes/bat_projectile.tscn") #Reference to bat projectile scene
@onready var damage_area = $Body

#Projectile
var projectile_direction: Vector2 #Projectile direction
var startingPosition: Vector2 #Starting direction

#Damage
@export var damage_amount = .5 #Damage for collision
@export var knockback_force: float = 300 #force of knockback
#----------------------------------------------------------------------------------------------------------------------------------
func _ready() -> void:
	startingPosition  = position #Setting the starting position
	time += SPEED+ (randf() * 100) #Random start
	if damage_area:
		damage_area.body_entered.connect(_on_body_body_entered)
	else: 
		print("Didnt work")

func _process(delta: float) -> void:
	time += delta * SPEED #Moves the bat along the path
	if is_following_player and target: #Checks to see if they are following the player and if the target is assigned.
		var direction = (target.position-position).normalized()
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
	move_and_slide() #Moves body based on velocity

	
	
func _on_point_body_entered(body: Node2D) -> void: #Checks if something entered the point
	if body.name == "Player":
		print("Player entered POV");
		target = body
		is_following_player = true
		SPEED = 60

func _on_point_body_exited(body: Node2D) -> void: #Checks if something exited the point
	if body.name == "Player":
		print("Player exited POV");

func _on_body_body_entered(body: Node2D) -> void: #If player collides with bat
	if body is CharacterBody2D and body.has_method("apply_knockback") and body.name == "Player":
		var knockback_direction = (body.global_position - global_position).normalized()
		print("Enemy collided with player")
		Health.take_damage(damage_amount)
		body.apply_knockback(knockback_direction, knockback_force)

func shoot(): #Shoots the projectile depending on where the mouse is aiming
	if projectile_direction == Vector2.ZERO:
		return  # Don't shoot if the bat isn't moving

	var instance = projectile.instantiate()
	instance.dir = projectile_direction  # Set the projectile's direction to the bat's direction (Vector2)
	instance.spawnPos = global_position  # Set the spawn position
	instance.spawnRot = rotation  # Optionally, if you need to set the rotation of the projectile
	main.add_child.call_deferred(instance)


func _on_projectile_cooldown_timeout(): #Shoot delay
	shoot()
	

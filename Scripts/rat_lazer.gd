extends CharacterBody2D

#Variables------------------------------------------------------------------------------------------------------------------------
#Rat movement variables
var SPEED = 15 #Movement Speed (Change to fit character movement)
@export var sizeOfPath: float = 40.0 #Size of the rat's path
var direction = -1 #Direction variable
var time: float = 0.0 #Time variable for movement
var startingPosition: Vector2 #Variable that holds the starting position
var is_following_player: bool = false #Variable that determines if the rat is following the player
var can_fire_laser: bool = true
var laser_damage: float = 1
#References
@onready var POV = $"Point of View" #Reference to the point of view area
@onready var rat_body = $CollisionShape2D #Reference to the rat's collision body
@onready var target = $"../Player" #Reference to the target (player)
@onready var animated_sprite = $AnimatedSprite2D #Reference to rat animated sprite
@onready var damage_area = $Area2D
@onready var laser_raycast = $Laser
@onready var laser_line2d = $Laser_line
@onready var laser_cooldown = $Cooldown
#Damage
@export var damage_amount = .5 #Damage that the rat causes to the player
@export var knockback_force: float = 300
#---------------------------------------------------------------------------------------------------------------------------------

func _ready() -> void:
	startingPosition = position  #Gives a random starting position
	time += SPEED+ (randf() * 100)
	if damage_area:
		damage_area.body_entered.connect(_on_area_2d_body_entered)
	else: 
		print("Didnt work")

func _process(delta: float) -> void:
	time += delta * SPEED 
	#follows the charcter
	if is_following_player and target:
		var direction = (target.position-position).normalized()
		velocity = direction * SPEED
		if abs(direction.x) > abs(direction.y):
			# Moving left or right
			if direction.x > 0:
				animated_sprite.play("RightMovement")
				animated_sprite.flip_h = false  # Face right
			else:
				animated_sprite.play("LeftMovement")
				animated_sprite.flip_h = false   # Face left
		else:
			# Moving up or down
			if direction.y > 0:
				animated_sprite.play("DownwardMovement")  # Play down animation
			else:
				animated_sprite.play("UpwardMovement")    # Play up animation
	#Moves in the Square movement
	else:
		fire_laser()
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
			animated_sprite.play("RightMovement")
			POV_position(180, -2, -4)
		elif phase == 1:
			#Move Down
			x = sizeOfPath
			y = progress
			POV_position(-90, 2, -4)

		elif phase == 2:
		#Move left
			x = sizeOfPath - progress
			y = sizeOfPath
			animated_sprite.play("LeftMovement")
			POV_position(0, 2, 0)

		elif phase == 3:
			#Move up
			x = 0
			y = sizeOfPath - progress
			animated_sprite.play("UpwardMovement")
			POV_position(-270, -2, 1.0)


		position = startingPosition + Vector2(x, y) 
	move_and_slide()

func _on_point_of_view_body_entered(body: Node2D) -> void: #If the player enters the point of view the rat follows the player
	if body.name == "Player":
		print("Player entered POV");
		target = body 
		is_following_player = true
		SPEED = 40 

func _on_point_of_view_body_exited(body: Node2D) -> void: #If the player exits the point of view (can be used for somethine later)
	if body.name == "Player":
		print("Player exited POV");

func _on_area_2d_body_entered(body: Node2D) -> void: #If the player collides with the rat
	if body is CharacterBody2D and body.has_method("apply_knockback") and body.name == "Player":
		var knockback_direction = (body.global_position - global_position).normalized()
		print("Enemy collided with player")
		Health.take_damage(damage_amount)
		body.apply_knockback(knockback_direction, knockback_force)
#	if body.name == "Player":
#		Health.take_damage(damage_amount) #Calls function that makes the player take damage from the rat

func POV_position(rotate_deg: float, position_x: float, position_y: float = 1.0) -> void:
		if position_y != 1.0:
			POV.position.y = position_y
			laser_raycast.position.y = position_y
			laser_line2d.position.y = position_y
		POV.rotation_degrees = rotate_deg
		POV.position.x = position_x
		laser_raycast.position.x = position_x
		laser_raycast.rotation_degrees = rotate_deg
		laser_line2d.rotation_degrees = rotate_deg
		laser_line2d.position.x = position_x
	
func fire_laser():
	if not can_fire_laser:
		print("Laser on cooldown")
		return

	can_fire_laser = false
	laser_cooldown.start()

	var laser_origin = laser_raycast.global_position
	var global_direction = (target.global_position - laser_origin).normalized()
	var laser_length = 70.0
	var global_end_point = laser_origin + global_direction * laser_length

	# Set direction and rotation
	laser_raycast.rotation = global_direction.angle()
	laser_line2d.rotation = global_direction.angle()
	
	laser_raycast.target_position = laser_raycast.to_local(global_end_point)
	laser_raycast.enabled = true
	laser_raycast.force_raycast_update()

	# Visual laser
	laser_line2d.clear_points()
	laser_line2d.add_point(Vector2.ZERO)
	laser_line2d.add_point(Vector2.RIGHT * laser_length)  # Since rotation handles the angle

	if laser_raycast.is_colliding():
		var collider = laser_raycast.get_collider()
		if collider == target:
			Health.take_damage(laser_damage)



func _on_cooldown_timeout() -> void:
	can_fire_laser = true

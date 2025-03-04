extends CharacterBody2D

@export var movement_speed: float = 100  # Movement speed (Can be change in the inspector)
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D  # Reference to the AnimatedSprite2D node so that we can modify it
@onready var timer: Timer = $Timer  # Reference to the Timer node so that we can modify it
@onready var invulnerable_timer: Timer = $IFrameTimer # Timer for jump. Set to 1 second. When the player jumps they're invulnerable to some traps.
@onready var Jump: Timer = $Jump #Timer for Jump
@onready var Reload = $Reload #Time for Reload
var character_direction: Vector2  # Used for our movement directional input
var rand_direction = randf() # Chooses a random number between 0 and 1 in decimal
var direction_facing: String # Store a string depending on the last direction the character was facing (Left, Right, Up, Down)
var invulnerable: bool = false 
var can_Jump: bool = true #Stop spamming jumping

@onready var pause_script = get_node("/root/GameScene/Canvases/PauseCanvas/CenterContainer/Control") #Reference to pause menu script

func _physics_process(delta: float) -> void:
	if not pause_script.paused: #Checks to see if the game is paused (if it is no movement can occur or changing direction
		#Update movement direction
		character_direction.x = Input.get_axis("left", "right")  # -1 for "left", 1 for "right" Gets input from left and right input
		character_direction.y = Input.get_axis("up", "down")  # -1 for "up", 1 for "down" Gets input from up and down input
		character_direction = character_direction.normalized()  # Normalize the direction for consistent speed
																# (Used to stop diagonal movement from going twice as fast)
		#Checks to see if jump is true
		if can_Jump:
			character_jump() # Jump function.
		# Only updates velocity if there's input
		if character_direction != Vector2.ZERO:
			velocity = character_direction * movement_speed # Multiplies the movement speed by the direction to dtermine the velocity

		# Play appropriate animation based on direction
			if character_direction.x < 0 and character_direction.y > 0: # Down and left (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "LeftRun": # If the animation isnt already playing then play animation
						animated_sprite.play("LeftRun")
						direction_facing = "Left" #Last direction facing 
				else:
					if animated_sprite.animation != "DownRun":
						animated_sprite.play("DownRun")
						direction_facing = "Down"
			elif character_direction.x < 0 and character_direction.y < 0:  # Up and left (Movmement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "LeftRun":
						animated_sprite.play("LeftRun")
						direction_facing = "Left"
				else:
					if animated_sprite.animation != "UpRun":
						animated_sprite.play("UpRun")
						direction_facing = "Up"
			elif character_direction.x > 0 and character_direction.y > 0:  # Down and right (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "RightRun":
						animated_sprite.play("RightRun")
						direction_facing = "Right"
				else:
					if animated_sprite.animation != "DownRun":
						animated_sprite.play("DownRun")
						direction_facing = "Down"
			elif character_direction.x > 0 and character_direction.y < 0:  # Up and right (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "RightRun":
						animated_sprite.play("RightRun")
						direction_facing = "Right"
				else:
					if animated_sprite.animation != "UpRun":
						animated_sprite.play("UpRun")
						direction_facing = "Up"
			elif character_direction.y > 0:  # Down (Movement)
				if animated_sprite.animation != "DownRun":
					animated_sprite.play("DownRun")
					direction_facing = "Down"
			elif character_direction.y < 0:  # Up (Movement)
				if animated_sprite.animation != "UpRun":
					animated_sprite.play("UpRun")
					direction_facing = "Up"
			elif character_direction.x > 0:  # Right (Movement)
				if animated_sprite.animation != "RightRun":
					animated_sprite.play("RightRun")
					direction_facing = "Right"
			elif character_direction.x < 0:  # Left (Movement)
				if animated_sprite.animation != "LeftRun":
					animated_sprite.play("LeftRun")
					direction_facing = "Left"
		else:
			# Stops the movement gradually
			velocity = velocity.move_toward(Vector2.ZERO, movement_speed)

	# When there is no movement, switch to idle animation depending on the direction the player was last facing
	if velocity == Vector2.ZERO:
		if direction_facing == "Down":
			if animated_sprite.animation != "DownIdle":
				animated_sprite.play("DownIdle")
		if direction_facing == "Up":
			if animated_sprite.animation != "UpIdle":
				animated_sprite.play("UpIdle")
		if direction_facing == "Left":
			if animated_sprite.animation != "LeftIdle":
				animated_sprite.play("LeftIdle")
		if direction_facing == "Right":
			if animated_sprite.animation != "RightIdle":
				animated_sprite.play("RightIdle")
	
	# Move the character based on the velocity variable above
	move_and_slide()
	#Checks to see if character died
	if(Health.player_health <= 0):
		Health.player_health = 0.01
		CoinSystem.player_coins = 0
		Reload.start()
		

func _ready(): # Placement of this might be a bit weird.
	invulnerable_timer.timeout.connect(_on_IFrameTimer_timeout)  
	Jump.timeout.connect(_on_jump_timeout)
	Reload.timeout.connect(_on_reload_timeout)

#invicible frames
func _on_IFrameTimer_timeout() -> void: # This timer starts the moment the space bar is pressed.
	print("No longer invicible to traps.") # This can be commented out. This is so we know when the jump has ended, since we've no sprite animation for it yet.
	invulnerable = false # Player can now be harmed/die.

#Lets Character Jump
func character_jump():
	if Input.is_action_just_pressed("jump"):
		print("Space is hit.") # Was just making sure the input was being read.
		invulnerable = true # Player cannot be harmed/die.
		invulnerable_timer.start() # Invulnerability timer begins.
		can_Jump = false
		print("Jump cooldown")
		Jump.start(3)
 
#Enables jump again
func _on_jump_timeout() -> void:
	can_Jump = true

#Reloads the Scene
func _on_reload_timeout() -> void:
	get_tree().reload_current_scene()
	Health.player_health = 3

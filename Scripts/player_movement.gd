extends CharacterBody2D

#Variables--------------------------------------------------------------------------------------------------------------------------------------------
#Player movement variables
@export var movement_speed: float = 100  #Movement speed of player (Can be change in the inspector)
var character_direction: Vector2  #Used for our movement directional input
var rand_direction = randf() #Chooses a random number between 0 and 1 in decimal
var direction_facing: String #Store a string depending on the last direction the character was facing (Left, Right, Up, Down)

#Timers
@onready var timer: Timer = $Timer  #Reference to the Timer node so that we can modify it
@onready var invulnerable_timer: Timer = $IFrameTimer #Timer for jump. Set to 1 second. When the player jumps they're invulnerable to some traps.
@onready var Jump: Timer = $Jump #Timer for Jump
@onready var Reload: Timer = $Reload #Time for Reloading the game
@onready var attack_cooldown: Timer = $AttackCooldown #Timer for attack cooldown
@onready var star_shooter_sound: AudioStreamPlayer2D = $starShooter
#Jump variables
var invulnerable: bool = false #Variable to determine if the player is invulnerable or not
var can_Jump: bool = true #Stop spamming jumping
var jump_delay_sec: float = 3

#Attack variables
var can_attack: bool = true #Variable that determines in the player can attack or not

#References
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D  #Reference to the AnimatedSprite2D node so that we can modify it
@onready var pause_script = get_node("/root/GameScene/Canvases/PauseCanvas/CenterContainer/Control") #Reference to pause menu script
var projectile_path = preload("res://Scenes//star_projectile.tscn") #Preloads the star projectile scene

#-----------------------------------------------------------------------------------------------------------------------------------------------------


func _physics_process(delta: float) -> void:
	if not pause_script.paused: #Checks to see if the game is paused (if it is no movement can occur or changing direction
		#Update movement direction
		character_direction.x = Input.get_axis("left", "right")  # -1 for "left", 1 for "right" Gets input from left and right input
		character_direction.y = Input.get_axis("up", "down")  # -1 for "up", 1 for "down" Gets input from up and down input
		character_direction = character_direction.normalized()  # Normalize the direction for consistent speed
																# (Used to stop diagonal movement from going twice as fast)
		#Checks to see if jump is true
		if can_Jump:
			character_jump() #Jump function.
		#Only updates velocity if there's input
		if character_direction != Vector2.ZERO:
			velocity = character_direction * movement_speed # Multiplies the movement speed by the direction to dtermine the velocity
		
		#Plays the appropriate animation based on direction
			if character_direction.x < 0 and character_direction.y > 0: #Down and left (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "LeftRun": #If the animation isnt already playing then play animation
						animated_sprite.play("LeftRun")
						direction_facing = "Left" #Last direction facing 
				else:
					if animated_sprite.animation != "DownRun":
						animated_sprite.play("DownRun")
						direction_facing = "Down"
			elif character_direction.x < 0 and character_direction.y < 0:  #Up and left (Movmement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "LeftRun":
						animated_sprite.play("LeftRun")
						direction_facing = "Left"
				else:
					if animated_sprite.animation != "UpRun":
						animated_sprite.play("UpRun")
						direction_facing = "Up"
			elif character_direction.x > 0 and character_direction.y > 0:  #Down and right (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "RightRun":
						animated_sprite.play("RightRun")
						direction_facing = "Right"
				else:
					if animated_sprite.animation != "DownRun":
						animated_sprite.play("DownRun")
						direction_facing = "Down"
			elif character_direction.x > 0 and character_direction.y < 0:  #Up and right (Movement)
				if(rand_direction <= 0.5):
					if animated_sprite.animation != "RightRun":
						animated_sprite.play("RightRun")
						direction_facing = "Right"
				else:
					if animated_sprite.animation != "UpRun":
						animated_sprite.play("UpRun")
						direction_facing = "Up"
			elif character_direction.y > 0:  #Down (Movement)
				if animated_sprite.animation != "DownRun":
					animated_sprite.play("DownRun")
					direction_facing = "Down"
			elif character_direction.y < 0:  #Up (Movement)
				if animated_sprite.animation != "UpRun":
					animated_sprite.play("UpRun")
					direction_facing = "Up"
			elif character_direction.x > 0:  #Right (Movement)
				if animated_sprite.animation != "RightRun":
					animated_sprite.play("RightRun")
					direction_facing = "Right"
			elif character_direction.x < 0:  #Left (Movement)
				if animated_sprite.animation != "LeftRun":
					animated_sprite.play("LeftRun")
					direction_facing = "Left"
		else:
			#Stops the movement gradually
			velocity = velocity.move_toward(Vector2.ZERO, movement_speed)

	#When there is no movement, switch to idle animation depending on the direction the player was last facing
	if velocity == Vector2.ZERO:
		if direction_facing == "Down": #Down idle animation
			if animated_sprite.animation != "DownIdle": 
				animated_sprite.play("DownIdle")
		if direction_facing == "Up": #Up idle animation
			if animated_sprite.animation != "UpIdle":
				animated_sprite.play("UpIdle")
		if direction_facing == "Left": #Left idle animation
			if animated_sprite.animation != "LeftIdle":
				animated_sprite.play("LeftIdle")
		if direction_facing == "Right": #Right idle animation
			if animated_sprite.animation != "RightIdle":
				animated_sprite.play("RightIdle")
	
	move_and_slide() #Move the character based on the velocity variable above

	if(Health.player_health <= 0): 	#Checks to see if character died
		Health.player_health = 0.01 #Fixes glitch that causes the player not to die
		Reload.start() #Restarts the scene as of now
	
	if(Input.is_action_just_pressed("attack")): #Calls the shoot projectile function if the attack button is pressed
		shootProjectile()

func _ready():
	#Connects all the timers to the variables
	invulnerable_timer.timeout.connect(_on_IFrameTimer_timeout)  
	Jump.timeout.connect(_on_jump_timeout)
	Reload.timeout.connect(_on_reload_timeout)
	attack_cooldown.timeout.connect(_on_attack_cooldown_timeout)

#Lets the Character Jump
func character_jump():
	if Input.is_action_just_pressed("jump"): #If the jump action was pressed
		print("Space is hit.") #Can be commented out (this is just for validation).
		invulnerable = true #Player cannot be harmed/die.
		invulnerable_timer.start() #Invulnerability timer begins.
		can_Jump = false #The player can't spam jump
		print("Jump cooldown")
		Jump.start(jump_delay_sec) #Jump cooldown timer of a certain amount of seconds start
 
#invicible frames
func _on_IFrameTimer_timeout() -> void: #This timer starts the moment the jump input is pressed when the timer is finished this function is used.
	print("No longer invicible to traps.") #This can be commented out. This is so we know when the jump has ended, since we've no sprite animation for it yet.
	invulnerable = false #Player can now be harmed/die.
	
#Enables jump again
func _on_jump_timeout() -> void:
	can_Jump = true #On jump timeout change the variable to true so that the character can jump again

#Reloads the Scene
func _on_reload_timeout() -> void: #Is called when the reload timer timeout (temporary mechanic)
	get_tree().reload_current_scene() #Reloads the scene
	Health.player_health = 3 #Resets the players health
	CoinSystem.player_coins = 0 #Resets the coin amount

func shootProjectile(): #Function that shoots projectile where the player is aiming
	if not can_attack or pause_script.paused: #If the player cant attack or the game is paused then the player cant shoot
		return
	star_shooter_sound.play()
	can_attack = false  #Prevent spam shooting
	attack_cooldown.start()  #Start the attack cooldown timer
	
	#Instance of projectile
	var projectile = projectile_path.instantiate()
	
	#Get mouse position
	var mouse_position = get_global_mouse_position()
	
	#Calculates the direction from the player to the mouse position
	var direction_to_mouse = (mouse_position - global_position).normalized()
	
	#Spawn offset
	var player_collision = $CollisionShape2D.shape 
	var base_spawn_distance = player_collision.get_rect().size.length() / 2 + 5  
	var spawn_offset = direction_to_mouse * base_spawn_distance  
	
	#Additional space for shooting down
	if direction_to_mouse.y > 0:  
		spawn_offset += Vector2(0, 8)  #Extra offset
	
	projectile.position = global_position + spawn_offset
	
	#Assign direction to projectile
	projectile.direction = direction_to_mouse  
	
	#Rotate the projectile
	projectile.rotation = direction_to_mouse.angle()
	
	#Add the projectile to the scene
	get_tree().current_scene.add_child(projectile)

func _on_attack_cooldown_timeout(): #Called when the attack cooldown timer ends
	can_attack = true #When the timer timeout the play can attack again

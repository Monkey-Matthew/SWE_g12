extends Node

var paused = false #Checks to tsee if the game is paused

#References
@onready var pauseMenuObj = $PauseMenu
@onready var resumeButton = $PauseMenu/VBoxContainer/Resume
@onready var exitButton = $PauseMenu/VBoxContainer/Exit

func _ready():
	pauseMenuObj.hide() #Hides menu when the game starts
	resumeButton.pressed.connect(pauseMenu) #Connects resume button to the pauseMenu function
	exitButton.pressed.connect(quit) #Connects exit button to quit function
	
func _process(delta):
	if Input.is_action_just_pressed("pause"): #If the pause button was pressed it opens the pause menu
		pauseMenu()
		
func quit(): #Closes the game when the exit button is pressed
	get_tree().quit()

func pauseMenu(): #Pauses the game and unpauses the game
	if paused:
		print("un-pausing")
		pauseMenuObj.hide()
		Engine.time_scale = 1
	else:
		print("pausing")
		pauseMenuObj.show()
		Engine.time_scale = 0
		
	paused = !paused
	

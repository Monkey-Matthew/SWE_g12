extends TextureRect

@onready var first_box_select = $"../../FirstBoxSelect"
@onready var second_box_select = $"../../SecondBoxSelect"
@onready var third_box_select = $"../../ThirdBoxSelect"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if(first_box_select.visible == true && CoinSystem.player_coins >= 1):
			print("You bought the first item")
			CoinSystem.player_coins -= 1
		elif(second_box_select.visible == true && CoinSystem.player_coins >= 2):
			print("You bought the second item")
			CoinSystem.player_coins -= 2
		elif(third_box_select.visible == true && CoinSystem.player_coins >= 3):
			print("You bought the third item")
			CoinSystem.player_coins -= 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

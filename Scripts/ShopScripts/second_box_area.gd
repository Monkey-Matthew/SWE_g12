extends TextureRect

@onready var description_label = $"../DescriptionBox/Label"
@onready var second_box_tint = $"../SecondItemBox/SecondBoxTint"
@onready var buy_box = $"../BuyBox"
@onready var buy_box_label = $"../BuyBox/Label"
@onready var first_box_select = $"../FirstBoxSelect"
@onready var second_box_select = $"../SecondBoxSelect"
@onready var third_box_select = $"../ThirdBoxSelect"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buy_box.visible = false
	second_box_tint.visible = false
	second_box_select.visible = false
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		buy_box.visible = true
		first_box_select.visible = false
		second_box_select.visible = true
		third_box_select.visible = false
		buy_box_label.text = "Buy - 2 Coins"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	description_label.text = "Health Upgrade - This makes your gain an extra heart"
	second_box_tint.visible = true


func _on_mouse_exited() -> void:
	description_label.text = ""
	second_box_tint.visible = false

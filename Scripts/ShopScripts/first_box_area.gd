extends TextureRect

@onready var description_label = $"../DescriptionBox/Label"
@onready var first_box_tint = $"../FirstItemBox/FirstBoxTint"
@onready var buy_box = $"../BuyBox"
@onready var buy_box_label = $"../BuyBox/Label"
@onready var first_box_select = $"../FirstBoxSelect"
@onready var second_box_select = $"../SecondBoxSelect"
@onready var third_box_select = $"../ThirdBoxSelect"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_box_tint.visible = false
	buy_box.visible = false
	first_box_select.visible = false
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		buy_box.visible = true
		first_box_select.visible = true
		second_box_select.visible = false
		third_box_select.visible = false
		buy_box_label.text = "Buy - 10 Coins"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	description_label.text = "Projectile Upgrade - This makes your stars deal more damage to enemies"
	first_box_tint.visible = true
	
func _on_mouse_exited() -> void:
	description_label.text = ""
	first_box_tint.visible = false

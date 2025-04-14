extends TextureRect

@onready var description_label = $"../DescriptionBox/Label"
@onready var first_box_tint = $"../FirstItemBox/FirstBoxTint"
@onready var buy_box = $"../BuyBox"
@onready var buy_box_label = $"../BuyBox/Label"
@onready var first_box_select = $"../FirstBoxSelect"
@onready var second_box_select = $"../SecondBoxSelect"
@onready var third_box_select = $"../ThirdBoxSelect"
@onready var shop_script = $"../.."

@onready var second_box = $"../SecondBoxArea"
@onready var third_box = $"../ThirdBoxArea"

var box_clicked = false
var is_hovering = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_box_tint.visible = false
	buy_box.visible = false
	first_box_select.visible = false
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(is_hovering == true):
		description_label.text = shop_script.firstItem["Description"]
	if(box_clicked == true && second_box.is_hovering == false && third_box.is_hovering == false):
		description_label.text = shop_script.firstItem["Description"]
		
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		buy_box.visible = true
		first_box_select.visible = true
		second_box_select.visible = false
		third_box_select.visible = false
		buy_box_label.text = "Buy - " + str(shop_script.firstItem["Cost"]) + " coins"
		description_label.text = shop_script.firstItem["Description"]
		second_box.box_clicked = false
		third_box.box_clicked = false
		box_clicked = true
		print("box clicked")
		

func _on_mouse_entered() -> void:
	print("first hovering")
	is_hovering = true
	if(box_clicked == false):
		description_label.text = shop_script.firstItem["Description"]
	first_box_tint.visible = true
	
func _on_mouse_exited() -> void:
	is_hovering = false
	if(box_clicked == false):
		description_label.text = ""
	first_box_tint.visible = false

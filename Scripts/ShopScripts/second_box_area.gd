extends TextureRect

@onready var description_label = $"../DescriptionBox/Label"
@onready var second_box_tint = $"../SecondItemBox/SecondBoxTint"
@onready var buy_box = $"../BuyBox"
@onready var buy_box_label = $"../BuyBox/Label"
@onready var first_box_select = $"../FirstBoxSelect"
@onready var second_box_select = $"../SecondBoxSelect"
@onready var third_box_select = $"../ThirdBoxSelect"
@onready var shop_script = $"../.."

var box_clicked = false
var is_hovering = false

@onready var first_box = $"../FirstBoxArea"
@onready var third_box = $"../ThirdBoxArea"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buy_box.visible = false
	second_box_tint.visible = false
	second_box_select.visible = false
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _process(delta: float) -> void:
	if(is_hovering == true):
		description_label.text = shop_script.secondItem["Description"]
	if(box_clicked == true  && first_box.is_hovering == false && third_box.is_hovering == false):
		description_label.text = shop_script.secondItem["Description"]
		
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		buy_box.visible = true
		first_box_select.visible = false
		second_box_select.visible = true
		third_box_select.visible = false
		buy_box_label.text = "Buy - " + str(shop_script.secondItem["Cost"])  + " coins"
		description_label.text = shop_script.secondItem["Description"]
		first_box.box_clicked = false
		third_box.box_clicked = false
		box_clicked = true
		print(box_clicked)
		

func _on_mouse_entered() -> void:
	print("second hovering")
	is_hovering = true
	if(box_clicked == false):
		description_label.text = shop_script.secondItem["Description"]
	second_box_tint.visible = true


func _on_mouse_exited() -> void:
	is_hovering = false
	if(box_clicked == false):
		description_label.text = ""
	second_box_tint.visible = false

extends TextureRect

@onready var first_box_select = $"../../FirstBoxSelect"
@onready var second_box_select = $"../../SecondBoxSelect"
@onready var third_box_select = $"../../ThirdBoxSelect"
@onready var shop_script = $"../../.."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if(first_box_select.visible == true && CoinSystem.player_coins >= shop_script.firstItem["Cost"]):
			CoinSystem.player_coins -= shop_script.firstItem["Cost"]
			ShopItems.itemPurchased(shop_script.firstItem["Name"])
		elif(second_box_select.visible == true && CoinSystem.player_coins >= shop_script.secondItem["Cost"]):
			CoinSystem.player_coins -= shop_script.secondItem["Cost"]
			ShopItems.itemPurchased(shop_script.secondItem["Name"])
		elif(third_box_select.visible == true && CoinSystem.player_coins >= shop_script.thirdItem["Cost"]):
			CoinSystem.player_coins -= shop_script.thirdItem["Cost"]
			ShopItems.itemPurchased(shop_script.thirdItem["Name"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends TextureRect

@onready var first_box_select = $"../../FirstBoxSelect"
@onready var second_box_select = $"../../SecondBoxSelect"
@onready var third_box_select = $"../../ThirdBoxSelect"
@onready var shop_script = $"../../.."

@onready var firstBoxArea = $"../../FirstBoxArea"
@onready var firstItemSprite = $"../../FirstItem"
@onready var secondBoxArea = $"../../SecondBoxArea"
@onready var secondItemSprite = $"../../SecondItem"
@onready var thirdBoxArea = $"../../ThirdBoxArea"
@onready var thirdItemSprite = $"../../ThirdItem"

@onready var firstBoxSelectBorder = $"../../FirstBoxSelect"
@onready var secondBoxSelectBorder = $"../../SecondBoxSelect"
@onready var thirdBoxSelectBorder = $"../../ThirdBoxSelect"

@onready var buyLabel = $"../Label"
@onready var descriptionLabel = $"../../DescriptionBox/Label"

@onready var buy_audio = $"../../ItemBoughtAudio"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures it receives input

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if(firstBoxArea.box_clicked == true && CoinSystem.player_coins >= shop_script.firstItem["Cost"]):
			CoinSystem.player_coins -= shop_script.firstItem["Cost"]
			buy_audio.play()
			ShopItems.itemPurchased(shop_script.firstItem["Name"])
			firstBoxArea.visible = false
			firstItemSprite.visible = false
			firstBoxSelectBorder.visible = false
			buyLabel.text = ""
			descriptionLabel.text = ""
			firstBoxArea.box_clicked = false
		elif(secondBoxArea.box_clicked == true && CoinSystem.player_coins >= shop_script.secondItem["Cost"]):
			CoinSystem.player_coins -= shop_script.secondItem["Cost"]
			buy_audio.play()
			ShopItems.itemPurchased(shop_script.secondItem["Name"])
			secondBoxArea.visible = false
			secondItemSprite.visible = false
			secondBoxSelectBorder.visible = false
			buyLabel.text = ""
			descriptionLabel.text = ""
			secondBoxArea.box_clicked = false
		elif(thirdBoxArea.box_clicked == true && CoinSystem.player_coins >= shop_script.thirdItem["Cost"]):
			CoinSystem.player_coins -= shop_script.thirdItem["Cost"]
			buy_audio.play()
			ShopItems.itemPurchased(shop_script.thirdItem["Name"])
			thirdBoxArea.visible = false
			thirdItemSprite.visible = false
			thirdBoxSelectBorder.visible = false
			buyLabel.text = ""
			descriptionLabel.text = ""
			thirdBoxArea.box_clicked = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

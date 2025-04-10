extends Node2D

@onready var canvas = $CanvasLayer
@onready var back_button = $CanvasLayer/BackBox/BackArea
@onready var player = $"../Player"
@onready var first_item_picture = $CanvasLayer/FirstItemBox/FirstItem
@onready var second_item_picture = $CanvasLayer/SecondItemBox/SecondItem
@onready var third_item_picture = $CanvasLayer/ThirdItemBox/ThirdItem

var firstItem
var secondItem
var thirdItem
var threeItemsChosen = false
var keys = ShopItems.items.keys()
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	canvas.visible = false
	var itemsChosen = 0
	while(threeItemsChosen == false):
		var randItemNum = randi_range(0,4)
		if(ShopItems.items[keys[randItemNum]]["Aquired"] == false):
			if(itemsChosen == 0):
				firstItem = ShopItems.items[keys[randItemNum]]
				ShopItems.items[keys[randItemNum]]["Aquired"] = true
				first_item_picture.texture = load(ShopItems.items[keys[randItemNum]]["ImagePath"])
				itemsChosen = 1
			elif(itemsChosen == 1):
				secondItem = ShopItems.items[keys[randItemNum]]
				ShopItems.items[keys[randItemNum]]["Aquired"] = true
				second_item_picture.texture = load(ShopItems.items[keys[randItemNum]]["ImagePath"])
				itemsChosen = 2
			elif(itemsChosen == 2):
				thirdItem = ShopItems.items[keys[randItemNum]]
				ShopItems.items[keys[randItemNum]]["Aquired"] = true
				third_item_picture.texture = load(ShopItems.items[keys[randItemNum]]["ImagePath"])
				itemsChosen = 3
		if(itemsChosen == 3):
			threeItemsChosen = true
			print(firstItem)
			print(secondItem)
			print(thirdItem)
		#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

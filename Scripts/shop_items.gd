extends Node

var items = {
	#Star colors
	"BlueStar": {"Name": "BlueStar", "Cost": 2, "ImagePath": "res://Images/Projectiles/bluestar.png", "Aquired": false},
	"PinkStar": {"Name": "PinkStar", "Cost": 1, "ImagePath": "res://Images/Projectiles/pinkstar.png", "Aquired": false},
	"PurpleStar": {"Name": "PurpleStar", "Cost": 3, "ImagePath": "res://Images/Projectiles/purplestar.png", "Aquired": false},
}

var keys = items.keys()
var star_sprite = load("res://Images/Projectiles/StarProjectile.png")
var star_color = Color("#FFF700")

func _ready() -> void:
	pass

func itemPurchased(itemName):
	if(itemName == "BlueStar"):
		star_sprite = load(items["BlueStar"]["ImagePath"])
		star_color = Color("#0642ff")
	if(itemName == "PinkStar"):
		star_sprite = load(items["PinkStar"]["ImagePath"])
		star_color = Color("#ff04bd")
	if(itemName == "PurpleStar"): 
		star_sprite = load(items["PurpleStar"]["ImagePath"])
		star_color = Color("#490090") #Change color (its hard to see the purple)
		
	
	print(itemName + " was purchased")

extends Node

var items = {
	#Star colors
	"BlueStar": {"Name": "BlueStar",
				 "Cost": 2,
				 "Description": "Blue Star: Makes Luna shoot blue stars",
				 "ImagePath": "res://Images/ShopIcons/bluestar.png",
				 "Aquired": false},
	"PinkStar": {"Name": "PinkStar",
				 "Cost": 1,
				 "Description": "Pink Star: Makes Luna shoot pink stars",
				 "ImagePath": "res://Images/ShopIcons/pinkstar.png",
				 "Aquired": false},
	"PurpleStar": {"Name": "PurpleStar",
				   "Cost": 3,
				   "Description": "Purple Star: Makes Luna shoot purple stars",
				   "ImagePath": "res://Images/ShopIcons/purplestar.png",
				   "Aquired": false},
	#Hearts
	"HalfHeart": {"Name": "HalfHeart",
				  "Cost": 2,
				  "Description": "Half Heart: Gain a half heart",
				  "ImagePath": "res://Images/ShopIcons/HalfHeartIcon.png",
				  "Aquired": false},
	"FullHeart": {"Name": "FullHeart",
				  "Cost": 4,
				  "Description": "Heart: Gain a heart",
				  "ImagePath": "res://Images/ShopIcons/FullHeartIcon.png",
				  "Aquired": false},
	#Shields
	"OneShield": {"Name": "OneShield",
				  "Cost": 3,
				  "Description": "Shield: Gain one shield",
				  "ImagePath": "res://Images/ShopIcons/shieldicon.png",
				  "Aquired": false},
	"ThreeShield": {"Name": "ThreeShield",
					"Cost": 8,
					"Description": "Shield Pack: Gain all shield",
					"ImagePath": "res://Images/ShopIcons/threeshield.png",
					"Aquired": false},
}

var keys = items.keys()
var star_sprite = load("res://Images/Projectiles/StarProjectile.png")
var star_color = Color("#FFF700")

var shop_opened = false

func _ready() -> void:
	pass

func itemPurchased(itemName):
	if(itemName == "BlueStar"):
		star_sprite = load(items["BlueStar"]["ImagePath"])
		star_color = Color("#0642ff")
	elif(itemName == "PinkStar"):
		star_sprite = load(items["PinkStar"]["ImagePath"])
		star_color = Color("#ff04bd")
	elif(itemName == "PurpleStar"): 
		star_sprite = load(items["PurpleStar"]["ImagePath"])
		star_color = Color("#490090") #Change color (its hard to see the purple)
	elif(itemName == "HalfHeart"):
		Health.player_health += .5
	elif(itemName == "FullHeart"): 
		Health.player_health += 1
	elif(itemName == "OneShield"):
		Health.player_shield += 1
	elif(itemName == "ThreeShield"):
		Health.player_shield += 3
	
	print(itemName + " was purchased")

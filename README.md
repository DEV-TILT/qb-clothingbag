# [QBCore] Clothing Bag

* [Support](https://discord.gg/NsgmZaTPa7)
* [Preview](https://streamable.com/mctvrs)

* Key to drop the bag: E

# Require

* [qb-target](https://github.com/qbcore-framework/qb-target)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)
* [progressbar](https://github.com/qbcore-framework/progressbar)

# Instructions

* Add this to **qb-core/shared/items.lua**
```
["clothingbag"]   	= {["name"] = "clothingbag", 		["label"] = "Clothing Bag", 	["weight"] = 150, 		["type"] = "item", 		["image"] = "clothing_bag.png", 			["unique"] = false,   	["useable"] = true,    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
```

* Add the image from the **images/clothingbag.png** to your **qb-inventory/html/images/** folder!

# THIS IS A WORK IN PROGRESS!

# Features

* **Input Business Name** - This allows your chosen job to input the business name for the license.
* **Input License Holder Name** - This allows your chosen job to input the license holder name for the license.
* **Input Expiry Date** - This allows your chosen job to input the expiry date for the license.
* **Simple Chat Command** - You can choose between a chat command and a ped to open the interaction menus!
* **Job-Locked Command** - Select the job to lock it to. Multiple job support coming soon!
* **Multi-Job Support** - Have as many jobs as you want allowed to do the command

# Installation

* Drag and Drop `as-licensing` into your resources directory
* Add the following to your qb-core>server>items.lua:
```lua
	-- as-licensing
	["alcohollicense"]                   	= {["name"] = "alcohollicense",                  	["label"] = "Alcohol License",     ["weight"] = 10,       ["type"] = "item",      ["image"] = "alcohollicense.png",    ["unique"] = true,      ["useable"] = false,     ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Alcohol License"},
```
* Add the following into your qb-inventory>html>js>app.js, under `itemData.name == "weaponlicense"`:
```js
        } else if (itemData.name == "alcohollicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Business Name: </strong><span>" +
                itemData.info.busname +
                "</span></p><p><strong>License Holder: </strong><span>" +
                itemData.info.licensename +
                "</span></p><p><strong>Officer First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Officer Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Expires: </strong><span>" +
                itemData.info.expirydate +
                "</span></p>"
            );
```

# Dependencies

* qb-core
* qb-menu
* qb-inventory
* qb-input or ox_lib

# Notes

* Drag and drop the image that is in the `images` folder, into qb-inventory>html>images

# Credits

* Alex (Me)
* Dan Pease for the assist on multi-job support
* KLM for the original ox_lib part
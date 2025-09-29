# Random_Module
*Random_Module in Lua/Luau language*

##
## Quick description of utility
Have you ever struggle to align each luck of all you element in a projet ? With rare instance drop this can lead to a miss understanting of the rarity of an instance

But with this module all your problem is **solve**, it sort all the instance by the rarest to the most commun, adapting each luck for the random selection

this module also include a luck modifier, with that value you can make the spin more lucky or more unlucky

**luck = 1 -> normal,**

**luck < 1 -> unlucky,**

**luck > 1 -> lucky**

##
## Function
**module.Spin(spin_table, luck : number)**

- Return a choosen instance in "spin_table" ( return instance is a table that contain only the ["name"] value and the ["luck"] value )

***spin_table need to have instance that have those 2 argument in there data :***

```lua
	["name"] = "Item_99",
	["luck"] = "1/10",
```

##
**module.Max_Luck(spin_table)**

- Return the addition of all the drop luck of each instances ( number )

spin_table need to have instance that have those 2 argument in there data :

```lua
	["name"] = "Item_1",
	["luck"] = "1/100",
```

##
**module.normalise_table(spin_table)**

- Return an array that contain only table, those table are sorted from the rarest instance to the most commun instances and contain two value from each instance of "spin_table" :

```lua
	["name"] = "Item_72",
	["luck"] = 1/10000, -- 1 / 10 000
```

## Thanks for reading all of that
enjoy the module :)

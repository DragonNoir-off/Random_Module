--[[
Creator : DragonNoir_off ( Github = https://github.com/DragonNoir-off )
Last Edit : 29/09/2025
Version [ 2 ]

]]

local module = {}

-- add all luck chance to get the total luck
function module.Max_Luck(data_table)
	local total_luck = 0
	for i,v in data_table do
		total_luck += tonumber(v.luck)
	end
	return total_luck
end

-- concate the transfer data into an array that contain only the name and luck of each element
function module.normalise_table(data_table)
	local arrays_data = {}
	
	local normalise_iteration, minimum_luck = 1, math.huge
	
	-- search for minimal chance ( base reference )
	for i,v in data_table do
		if tonumber(v.luck) < minimum_luck then
			minimum_luck = tonumber(v.luck)
		end
	end
	
	-- get normalisation iteration to normalise every luck instances
	repeat
		normalise_iteration *= 10
		minimum_luck *= 10
	until minimum_luck >= 1
	
	-- creation of the element of "array_data"
	for i,v in data_table do
		table.insert(arrays_data, {luck = tonumber(v.luck) * normalise_iteration, name = v.name})
		table.sort(arrays_data, function(a,b)
			return a.luck < b.luck
		end)
	end
	
	return arrays_data
end

function module.Spin(spin_table : SharedTable, luck)
	
	-- spin data
	local array_data = module.normalise_table(spin_table)
	local max_luck = module.Max_Luck(array_data)
	local spin = math.random(0, max_luck) / luck -- luck < 1 will decrease spawn rate of instances
	
	local weight = 0
	
	for i,v in array_data do
		if spin <= tonumber(v.luck) + weight then
			return v
		else
			weight += tonumber(v.luck)
		end
	end
	
	return nil
	
end

return module

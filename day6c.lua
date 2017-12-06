#!/usr/bin/env lua5.3
--bp file input
function lines_from(file)
	lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

local lines = lines_from('day6.txt')
banks = {}
for num in lines[1]:gmatch("%w+") do table.insert(banks,tonumber(num)) end

--day 6a
function puzzle(data)
	local output
	local seenSet = {}
	local count = 0

	while true do
		count = count + 1
		local maxIndex = findMaxIndex(data)
		local numToDistribute = data[maxIndex]
		data[maxIndex] = 0
		local i = maxIndex + 1
		while numToDistribute > 0 do
			if i > #data then
				 i = 1
			 end
			data[i] = data[i] + 1
			numToDistribute = numToDistribute - 1
			i = i + 1
		end
		local key = table.concat(data,',')
		if key == "1,0,14,14,12,11,10,9,9,7,5,5,4,3,7,1" then
			return count
		end
		if seenSet[key] then
			
			return count 
			

		end
		seenSet[key] = data
	end
	
end

function findMaxIndex(list)
	local max = -1
	local maxIndex = 1
	for i=1, #list do
		if list[i] > max then
			max = list[i]
			maxIndex = i
		end
	end
	return maxIndex
end

print(puzzle(banks))

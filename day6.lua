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
function solidify(a)
	s = table.concat(a,',')
	return s
end

function distribute(b,m,i)
	b[i] = 0
	if i+1 > #b then o = 1 else o = i+1 end
	while m>0 do
		b[o] = b[o] + 1
		m = m - 1
		if o + 1 > #b then o = 1 else o = o+1 end
--	for o=1, m, 1 do
--		b[((i+o)%#b)+1] = b[((i+o)%#b)+1] + 1
	end
	return b
end


function tablemax(table)
	local xnum = 0
	for i,x in pairs(table) do
		if x>xnum then
			xnum=x
		end
	end
	return xnum
end

function intable(t, v)
	for ind, val in ipairs(t) do
		if v == val then
			return true 
		end
	end
	return false
end


function getindex(t,v)
	local indices ={}
	for key,val in pairs(t) do
		indices[val] = key
	end
	return indices[v]
end
--
seen = {}
table.insert(seen, solidify(banks))
			
for i=1, 40, 1 do
	banks = distribute(banks, tonumber(tablemax(banks)), tonumber(getindex(banks, tablemax(banks))))
	sol = solidify(banks)
	print(sol)
	if intable(seen,sol) then
		print(#seen)
	else
		table.insert(seen, sol)
	end
end
print(#seen)


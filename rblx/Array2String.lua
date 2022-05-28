function array2string(a)
	local str = "["
	for i = 1, #a do
		str = str.."\""..a[i].."\","
	end
	local arr = str:gsub(".?$","");
	arr = arr.."]"
	return arr
end

function join(s)
	local s1 = s:gsub(".?$","");
	s1 = s1:sub(2)
	s1 = string.gsub(s1, "\"", "")
	return s1
end

return {
	a2s = array2string,
	join = join
}

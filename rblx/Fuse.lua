local requests = game:GetService('HttpService')
local array2string = require(script.Parent.Array2String)
local Base64 =  require(script.Parent.Base64)
local atob = Base64.atob
local btoa = Base64.btoa
local url
local funcs2 = {}

function FUSE_MAKE(host)
	url = 'http://'..host..'/fuse/'
	local funcs = requests:JSONDecode(requests:GetAsync(url..'functions')).list
	for i = 1, #funcs do
		funcs2[funcs[i]] = function(...)
			if ... then
				return requests:GetAsync(url.."run/"..funcs[i].."?args="..btoa(array2string.join(array2string.a2s(table.pack(...)))))
			else
				return requests:GetAsync(url.."run/"..funcs[i])
			end
		end
	end
	return funcs2
end

return {
	connect = FUSE_MAKE
}

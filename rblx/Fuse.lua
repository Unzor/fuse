local requests = game:GetService('HttpService')
local array2string = require(script.Parent.Array2String)
local Base64 =  require(script.Parent.Base64)
local atob = Base64.atob
local btoa = Base64.btoa
local url

function FUSE_FN(name, args) 
	if args then
		return requests:GetAsync(url.."run/"..name.."?args="..btoa(array2string.join(array2string.a2s(args))))
	else
		return requests:GetAsync(url.."run/"..name)
	end
end

function FUSE_MAKE(host)
	url = 'http://'..host..'/fuse/'
	return {
		run = FUSE_FN
	}
end

return {
	connect = FUSE_MAKE
}

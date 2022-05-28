# fuse
A Roblox tool that allows you to export Node.js functions to a game.

# Usage
preload.json:
```json
{
	"files": [
		"second.js"
	]
}
```
second.js:
```js
function test(a1) {
	return "Hello, " + a1 + "!" 
};
FUSE_FN(test)
```

Script (check /rblx for Fuse code):
```lua
local fuse = require(game.ServerScriptService.Fuse)

local host = fuse.connect('localhost:3000')
local result = host.run("test", {"world"})

print(result)
```
Now, run:
```
npm i -g rblx-fuse && npx fuse -u preload.json
```

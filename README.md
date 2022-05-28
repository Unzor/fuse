# fuse
A Roblox tool that allows you to export Node.js functions to a game.

# Usage
preload.json:
```json
{
	"files": [
		"test.js"
	]
}
```
test.js:
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
After running the script, run the game, and you should see something like this:
![E](https://user-images.githubusercontent.com/71789103/170841239-75156411-c214-41c7-bd36-52f5a443c946.png)
If you see this, it worked!
# Running on Heroku
To deploy to Heroku, use [fuse-heroku](https://github.com/Unzor/fuse-herpku), or click below:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/Unzor/fuse-heroku/tree/main)

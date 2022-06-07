# fuse
A Roblox tool that allows you to export Node.js functions to a game.

Do not use in production unless hosted on a cloud server.

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
local result = host.test("world")

print(result)
```
Now, run:
```
npm i -g rblx-fuse && fuse -u preload.json
```
(you can also use --use before your preload file)
After running the script, run the game, and you should see something like this:
![E](https://user-images.githubusercontent.com/71789103/170841239-75156411-c214-41c7-bd36-52f5a443c946.png)
If you see this, it worked!
# Running on Heroku
To deploy to Heroku, fork [fuse-heroku](https://github.com/Unzor/fuse-heroku), modify "functions.js", and deploy it.

Once deployed, use this code, and replace "my-app-name" with your Heroku app name:
```lua
local fuse = require(game.ServerScriptService.Fuse)

local host = fuse.connect('my-app-name.herokuapp.com')
local result = host.test("world")

print(result)
```
If you want, you can also try running an already-running demo of this ([repo](https://github.com/unisocket3/fuse-heroku-test)):
```lua
local fuse = require(game.ServerScriptService.Fuse)

local host = fuse.connect('fuse-rblx-demo.herokuapp.com')
local result = host.hello("world")

print(result)
```
# Asynchronous functions
Asynchronous functions are in fact, possible. Just add "async" before your function or return a promise, and it will give the same result!

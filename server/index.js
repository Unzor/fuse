#!/usr/bin/env node

const express = require('express');
const fs = require("fs");
var parser = require("cli2json");
var args = parser.parse(process.argv.slice(2).join(" "), {
    readCommandAfter: ["-u", "--use", "-a", "--attach"]
})
const app = express();
app.use(express.static(__dirname));

function arrayFindIncludes(r, n) {
    var u;
    var a = null;
    n.forEach(function(n) {
        if (n.includes(r)) {
            u = n;
            a = n
        } else {
            u = a
        }
    });
    return u
}

function FUSE_FN(fn) {
    var fne;
    app.get("/fuse/run/" + fn.name, async (req, res) => {
        if (req.query.args) {
            var args = atob(req.query.args).split(",");
            if (fn.constructor.name == "AsyncFunction") {
                res.send(await fn(...args))
            } else {
                res.send(fn(...args))
            }
        } else {
            if (fn.constructor.name == "AsyncFunction") {
                res.send(await fn(...args))
            } else {
                res.send(fn(...args))
            }
        }
    })
}

if (arrayFindIncludes("-u", args.flags) || arrayFindIncludes("--use", args.flags)) {
    var preload = JSON.parse(fs.readFileSync(args.flags[0].split(" ")[1]).toString());
    preload.files.forEach(function(file) {
        eval(fs.readFileSync(file).toString())
    })
} else if (arrayFindIncludes("-a", args.flags) || arrayFindIncludes("--attach", args.flags)) {
    console.log(args.flags[0].split(" ")[1])
    eval(fs.readFileSync(args.flags[0].split(" ")[1]).toString())
}

app.get('/fuse/attach/:code', (req, res) => {
    eval(atob(req.params.code))
    res.send("attached")
});

app.listen(3000, () => {
    console.log('Fuse server started')
})

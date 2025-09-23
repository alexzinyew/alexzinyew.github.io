local fs = require "@lune/fs"

print "Building"

local function doctype(page)
	return "<!doctype html>\n" .. page
end

fs.writeDir "out/"

fs.writeFile("out/index.html", doctype(require "@src/pages/index"()()))

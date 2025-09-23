local fs = require "@lune/fs"
local net = require "@lune/net"
local proc = require "@lune/process"
local task = require "@lune/task"

local dev_mode = proc.args[1] == "dev" and true or false
local build_mode = proc.args[1] == "build" and true or false
local serve_mode = proc.args[1] == "serve" and true or false
assert(dev_mode or build_mode or serve_mode, "expected mode")


local function build()
	proc.exec("lune", { "run", "src/build" }, { cwd = proc.cwd, stdio = "forward" })
end

if dev_mode then
	task.spawn(function()
		local prev_metadatas = {}
		while task.wait(0.25) do
			for _, file in fs.readDir "src/pages" do
				file = "src/pages/" .. file

				local metadata = fs.metadata(file)
				local prev = prev_metadatas[file]
				prev_metadatas[file] = metadata.modifiedAt

				if prev ~= nil and prev ~= metadata.modifiedAt then
					build()
					break
				end
			end
		end
	end)
end

if build_mode then
    build()
end

if serve_mode then
    local address = dev_mode and "http://127.0.0.1" or "https://0.0.0.0"
    local port = assert(tonumber(assert(proc.args[2], "expected port") :: any))

    print("Serving on " .. address .. ":" .. port)

    net.serve(port, {
        address = address,
        handleRequest = function(req)
            if req.path:match("^/assets/") then
                local fpath = req.path:gsub("^/",  "")
                if fs.isFile(fpath) then
                    return {
                        status = 200,
                        body = fs.readFile(fpath)
                    }
                end
                return { status = 404 }
            end
            return {
                status = 200,
                body = fs.readFile("out/index.html")
            }
        end,
    })
end

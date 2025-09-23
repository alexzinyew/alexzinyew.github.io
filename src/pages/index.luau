local h = require "@vendor/htmluau"

local font = require "@src/font"

return function()
	return h.html { lang = "en", style = "display: table; margin: auto" } {
		h.head() {
			h.title() { "lil page" },
			h.meta { charset = "utf-8" } {},
			h.style() { font },
			h.style() { "* { color: white }" },
		},
		h.body {
			style = 'font-family: "Source Code Pro"; display: table-cell;\
            vertical-align: middle; width: 500px; background-color: rgb(45 45 45)',
		} {
			h.header() {
				h.h1 { style = "color: #f569cb; max-height: 20px" } {
					"lilllllllllllllllith",
				},
				h.p() { h.em() { "she / her" } },
			},

			h.main { style = "" } {
				h.p() {
					"welcome to my page, here i show just about whatever but it\
                    mostly acts as an introduction for myself",
				},
				h.p() {
                    "please refer to me as lill. lillith is more of a formal name to me!"
				},
			},

			h.footer { style = "position: absolute; bottom: 0" } {
				"built on " .. os.date() .. " with " :: any,
                h.a { href = "https://github.com/Nicell/htmluau/" } { "htmluau" }
			},
		},
	}
end

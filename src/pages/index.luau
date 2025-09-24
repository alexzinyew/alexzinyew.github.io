local h = require "@vendor/htmluau"

local font = require "@src/font"

return function()
	return h.html { lang = "en", style = "display: table; margin: auto" } {
		h.head() {
			h.title() { "lil page" },
			h.meta { charset = "utf-8" } {},
			h.style() { font },
			h.style() { "* { color: white }" },
			h.meta { property = "og:title", content = "lillith page" } {},
			h.meta { property = "og:type", content = "website" } {},
		},
		h.body {
			style = 'font-family: "Source Code Pro"; display: table-cell;\
            vertical-align: middle; width: 500px; background-color: rgb(45 45 45)',
		} {
			h.header() {
				h.h1 { style = "color: #f569cb; max-height: 20px" } {
					"lilllllllllllllllith",
				},
				h.em() { "she / her" },
			},

			h.main() {
				h.p() {
					"please call me " :: any,
					h.span { style = "color: #f569cb" } { "lill" },
					"though casually, as lillith is more of a formal name and\
                    lilly is too endearing!",
				},
				h.p() {
					"welcome to my page, here i show just about whatever but it\
                    mostly acts as my" :: any,
					h.a { href = "/me" } { "about me" },
				},
				h.div { style = "display: flex" } {
					h.img {
						src = "/assets/me.webp",
						alt = "a blocky roblox avatar, with\
                            black hair, black hat, long hair down below the shoulders,\
                            brown plaid jacket, belt, and jeans",
						style = "max-width: 50%; height: 50%",
					} {},
					h.div { style = "float: right; max-width: 50%" } {
						h.p() {
							"this is my roblox avatar on the left. i do some\
                            development on roblox and small tooling projects.",
						},
						h.p() {
							"i also have a thing for source engine. particularly portal 2\
                            where i used to speedrun and also make mods for, some of which\
                            are on a mod loader for portal 2 called" :: any,
							h.a { href = "https://p2r3.com/spplice" } {
								"spplice",
							},
						},
					},
				},
			},

			h.footer { style = "position: absolute; bottom: 10px" } {
				"built on " .. os.date() .. " with " :: any,
				h.a { href = "https://github.com/Nicell/htmluau/" } { "htmluau" },
			},
		},
	}
end

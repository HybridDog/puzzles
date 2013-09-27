puzzles_list = {
	{"nhvbugtree", "Nyanland BugTree", 64, 128, 16},
}

for _,puzzle in ipairs(puzzles_list) do
	local puzzlenam = puzzle[1]
	local puzzledsc = puzzle[2]
	local puzzleszx = puzzle[3]
	local puzzleszy = puzzle[4]
	local tile_scale = puzzle[5]
	local framecountx = puzzleszx/tile_scale
	local framecounty = puzzleszy/tile_scale

	for ycount = 0,framecounty-1,1 do
		local texture_framed_y = "[verticalframe:"..framecounty..":"..ycount
		for xcount = 0,framecountx-1,1 do
			local texture_framed_x = "[verticalframe:"..framecountx..":"..xcount
			local texture = "puzzles_"..puzzlenam..".png^"..texture_framed_y.."^[transformR90^"..texture_framed_x.."^[transformR270"

			minetest.register_node("puzzles:"..puzzlenam.."_"..xcount.."_"..ycount, {
				description = puzzledsc,
				tiles = {texture, "default_wood.png",
					texture.."^[transformR90", texture.."^[transformR270", texture.."^[transformFX^[transformFY", texture.."^[transformFY"},
				groups = {dig_immediate=2},
				sounds = default.node_sound_wood_defaults(),
			})
		end
	end
end

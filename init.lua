print("[puzzles] loading...")
local t1 = os.clock()

dofile(minetest.get_modpath("puzzles").."/puzzles_list.lua")

for _,puzzle in ipairs(puzzles_list) do
	local t2 = os.clock()
	local puzzlenam = puzzle[1]
	local puzzledsc = puzzle[2]
	local framecountx = puzzle[3]
	local framecounty = puzzle[4]
	local side_texture = "^puzzles_side.png"

	for ycount = 0,framecounty-1,1 do
		local texture_framed_y = "[verticalframe:"..framecounty..":"..ycount
		for xcount = 0,framecountx-1,1 do
			local texture_framed_x = "[verticalframe:"..framecountx..":"..xcount
			local texture = "puzzles_"..puzzlenam..".png^"..texture_framed_y.."^[transformR90^"..texture_framed_x.."^[transformR270"
			local textures = {
				texture,
				"puzzles_bottom.png",
				texture.."^[transformR90^[transformFX"..side_texture,
				texture.."^[transformR270^[transformFX"..side_texture,
				texture.."^[transformFX"..side_texture,
				texture.."^[transformFY"..side_texture
			}

			minetest.register_node("puzzles:"..puzzlenam.."_"..xcount.."_"..ycount, {
				description = puzzledsc,
				tiles = textures,
				groups = {dig_immediate=2},
				sounds = default.node_sound_wood_defaults(),
			})
		end
	end
	print(string.format("[puzzles] "..puzzlenam.." loaded after: %.2fs", os.clock() - t2))
end

print(string.format("[puzzles] all puzzles loaded after: %.2fs", os.clock() - t1))

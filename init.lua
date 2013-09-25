puzzles_list = {
	{"nhvbugtree", "Nyanland BugTree", 544, 688},
}

for _,puzzle in ipairs(puzzles_list) do
	local puzzlenam = puzzle[1]
	local puzzledsc = puzzle[2]
	local puzzleszx = puzzle[3]
	local puzzleszy = puzzle[4]
	local xcnt = puzzleszx/16
	local ycount = puzzleszy/16


	while ycount ~= 0 do
		local texpos_y = ycount*16
		local xcount = xcnt
		while xcount ~= 0 do
			local texture_pos = puzzleszx.."x"..puzzleszy..":"..xcount*16 ..","..texpos_y
			local texture = "puzzles_invisible.png^[combine:"..texture_pos.."=puzzles_"..puzzlenam..".png"

			minetest.register_node("puzzles:"..puzzlenam.."_"..xcount.."_"..ycount, {
				description = puzzledsc,
				tiles = {texture, "default_wood.png", "default_wood.png"},
				groups = {dig_immediate=2},
				sounds = default.node_sound_wood_defaults(),
			})
			xcount = xcount-1
		end
		ycount = ycount-1
	end
end

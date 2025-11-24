local function create_note(is_weekly)
	-- 1. Define and expand base paths ONCE
	local journal_dir = vim.fn.expand("~/notes/2_AREAS/journal")
	local template_dir = vim.fn.expand("~/notes/3_RESOURCES/utilities/templates")

	-- 2. Calculate date components
	local date = os.date("*t")
	local year = date.year
	local quarter = math.floor((date.month - 1) / 3) + 1
	-- Create the full year/quarter path (e.g., /home/user/notes/2_AREAS/journal/2025/q4)
	local note_folder_path = string.format("%s/%s/q%d", journal_dir, year, quarter)

	local note_name, template_name
	if is_weekly then
		-- ---
		-- IMPROVEMENT: Creates a stable weekly note name (e.g., w01.md, w02.md...)
		-- Your calculation for the week of the quarter is correct.
		-- ---
		local start_of_quarter = os.time({ year = year, month = (quarter - 1) * 3 + 1, day = 1 })
		local week_num = math.floor((os.time(date) - start_of_quarter) / (7 * 86400)) + 1
		week_num = math.min(math.max(week_num, 1), 13) -- Clamp to 1-13

		-- Use %02d to get 'w01', 'w02' for proper file sorting
		note_name = string.format("w%02d.md", week_num)
		template_name = "weekly.md"
	else
		-- Daily note name is perfect
		note_name = string.format("%s.md", os.date("%Y-%m-%d"))
		template_name = "daily.md"
	end

	-- 3. Define final paths
	local note_path = string.format("%s/%s", note_folder_path, note_name)
	local template_path = string.format("%s/%s", template_dir, template_name)

	-- 4. ---
	-- IMPROVEMENT: Simplified file opening logic.
	-- This replaces the explorer check and the 'enew'/'bw!' dance.
	-- ---
	local file_exists = vim.fn.filereadable(note_path) == 1

	if not file_exists then
		-- Ensure the directory exists before opening the file
		vim.fn.mkdir(note_folder_path, "p")
	end

	-- Open the file (new or existing). This just works, even from oil.nvim.
	vim.cmd("edit " .. note_path)

	-- If the file was new, load the template into the buffer
	if not file_exists then
		if vim.fn.filereadable(template_path) == 1 then
			-- Read the template into the new buffer
			vim.cmd("silent! 0r " .. template_path)
		else
			-- Use modern vim.notify for errors
			vim.notify("Template file not found: " .. template_path, vim.log.levels.WARN, { title = "Journal" })
		end
	end
end

-- Keybindings (unchanged, they are perfect)
vim.keymap.set("n", "<leader>fd", function()
	create_note(false)
end, { desc = "Daily note" })
vim.keymap.set("n", "<leader>fw", function()
	create_note(true)
end, { desc = "Weekly plan" })

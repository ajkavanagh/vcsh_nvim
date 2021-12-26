local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    mappings = {
      i = {
        -- ensure a single escape closes the dialo
        ["<esc>"] = actions.close,
      },
    },
  },
})

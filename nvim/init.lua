-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.filetype.add({
  extension = {
    cpp = "cpp",
    h = "cpp",
  },
})

-- lsp.lua
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            vim.fn.stdpath("data") .. "/mason/bin/clangd.cmd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--query-driver=C:/Users/ASUS/scoop/apps/gcc/current/bin/g++.exe",
          },
          capabilities = capabilities, -- 👈 this line enables LSP -> cmp bridge
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git", ".")(
              fname
            )
          end,
        },

        arduino_language_server = {
          cmd = {
            "arduino-language-server",
            "-cli-config",
            os.getenv("USERPROFILE") .. "\\arduino-cli.yaml",
            "-cli",
            "arduino-cli",
            "-clangd",
            vim.fn.stdpath("data") .. "/mason/bin/clangd.cmd",
          },
          capabilities = capabilities,
        },
      },
    },
  },
}

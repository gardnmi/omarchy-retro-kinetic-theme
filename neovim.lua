return {
  {
    "bjarneo/aether.nvim",
    name = "aether",
    priority = 1000,
    opts = {
      disable_italics = false,
      colors = {
        base00 = "#0D1011",
        base01 = "#141617",
        base02 = "#1A1D1E",
        base03 = "#777C7A",
        base04 = "#A8ADAA",
        base05 = "#F2F3EE",
        base06 = "#F7F7F2",
        base07 = "#FFFFFF",
        base08 = "#F23838",
        base09 = "#FF5252",
        base0A = "#FFFF00",
        base0B = "#20C967",
        base0C = "#F23838",
        base0D = "#168DE2",
        base0E = "#FF5252",
        base0F = "#FFFF66",
      },
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}

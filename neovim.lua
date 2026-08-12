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
      local highlights = {
        Normal = { fg = "#F2F3EE", bg = "#0D1011" },
        NormalFloat = { fg = "#F2F3EE", bg = "#090B0C" },
        Comment = { fg = "#777C7A", italic = true },
        CursorLine = { bg = "#1A1D1E" },
        CursorLineNr = { fg = "#FFFF00", bold = true },
        Directory = { fg = "#168DE2", bold = true },
        FloatBorder = { fg = "#168DE2", bg = "#090B0C" },
        LineNr = { fg = "#777C7A" },
        NonText = { fg = "#777C7A" },
        Visual = { bg = "#1A1D1E" },
        WinSeparator = { fg = "#777C7A" },
        Constant = { fg = "#F23838" },
        String = { fg = "#F2F3EE" },
        Character = { fg = "#F2F3EE" },
        Number = { fg = "#FFFF00" },
        Boolean = { fg = "#FFFF00" },
        Identifier = { fg = "#F2F3EE" },
        Function = { fg = "#168DE2", bold = true },
        Statement = { fg = "#168DE2", bold = true },
        Keyword = { fg = "#F23838", bold = true },
        Conditional = { fg = "#F23838" },
        Repeat = { fg = "#F23838" },
        Operator = { fg = "#F2F3EE" },
        PreProc = { fg = "#F23838" },
        Type = { fg = "#FFFF00", bold = true },
        Special = { fg = "#F23838" },
        DiagnosticError = { fg = "#F23838" },
        DiagnosticWarn = { fg = "#FFFF00" },
        DiagnosticInfo = { fg = "#168DE2" },
        DiagnosticHint = { fg = "#20C967" },
        GitSignsAdd = { fg = "#20C967" },
        GitSignsChange = { fg = "#FFFF00" },
        GitSignsDelete = { fg = "#F23838" },
        ["@comment"] = { link = "Comment" },
        ["@string"] = { link = "String" },
        ["@number"] = { link = "Number" },
        ["@boolean"] = { link = "Boolean" },
        ["@function"] = { link = "Function" },
        ["@function.call"] = { link = "Function" },
        ["@constructor"] = { fg = "#F23838" },
        ["@keyword"] = { link = "Keyword" },
        ["@module"] = { fg = "#168DE2" },
        ["@operator"] = { link = "Operator" },
        ["@property"] = { fg = "#168DE2" },
        ["@punctuation.bracket"] = { fg = "#F2F3EE" },
        ["@punctuation.delimiter"] = { fg = "#F2F3EE" },
        ["@type"] = { link = "Type" },
        ["@variable"] = { link = "Identifier" },
        ["@variable.builtin"] = { fg = "#F23838" },
        ["@variable.member"] = { fg = "#168DE2" },
        ["@variable.parameter"] = { fg = "#FFFF00" },
        ["@lsp.type.class"] = { link = "Type" },
        ["@lsp.type.enum"] = { link = "Type" },
        ["@lsp.type.enumMember"] = { fg = "#FFFF00" },
        ["@lsp.type.function"] = { link = "Function" },
        ["@lsp.type.interface"] = { link = "Type" },
        ["@lsp.type.keyword"] = { link = "Keyword" },
        ["@lsp.type.method"] = { link = "Function" },
        ["@lsp.type.namespace"] = { fg = "#168DE2" },
        ["@lsp.type.number"] = { link = "Number" },
        ["@lsp.type.parameter"] = { fg = "#FFFF00" },
        ["@lsp.type.property"] = { fg = "#168DE2" },
        ["@lsp.type.string"] = { link = "String" },
        ["@lsp.type.struct"] = { link = "Type" },
        ["@lsp.type.type"] = { link = "Type" },
        ["@lsp.type.typeParameter"] = { link = "Type" },
        ["@lsp.type.variable"] = { link = "Identifier" },
      }

      local function apply_highlights()
        for group, highlight in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, highlight)
        end
      end

      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      apply_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "aether",
        callback = apply_highlights,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.schedule(apply_highlights)
        end,
      })
      require("aether.hotreload").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local background = "#0D1011"
      local raised = "#1A1D1E"
      local foreground = "#F2F3EE"
      local muted = "#777C7A"

      local function mode(accent)
        return {
          a = { bg = accent, fg = background, gui = "bold" },
          b = { bg = raised, fg = accent },
          c = { bg = background, fg = foreground },
        }
      end

      opts.options.theme = {
        normal = mode("#168DE2"),
        insert = mode("#20C967"),
        visual = mode("#FFFF00"),
        replace = mode("#F23838"),
        command = mode("#FFFF00"),
        terminal = mode("#168DE2"),
        inactive = {
          a = { bg = raised, fg = muted },
          b = { bg = background, fg = muted },
          c = { bg = background, fg = muted },
        },
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}

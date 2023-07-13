local Util = require("ermaolaoye.util")
return {
  -- windows.nvim with animation
  -- for autofocus on the current activate pane
  -- the  
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = true },
    },
    opts = {
      animation = { enable = true, duration = 150, fps = 120 },
      autowidth = { enable = true },
    },
    keys = { { "<leader>m", "<cmd>WindowsMaximize<CR>", desc = "Zoom window" } },
    init = function()
      vim.o.winwidth = 30
      vim.o.winminwidth = 30
      vim.o.equalalways = true
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "Thick",
        indicator = {
          style = "none",
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = {
          {
            filetype = "neo-tree",
            text = "  FILE EXPLORER",
            text_align = "center",
            separator = true, -- set to `true` if clear background of neo-tree
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },

      },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = true,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      extensions = {
        'neo-tree',
        'toggleterm',
        'lazy'
      },
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2},
        },
        lualine_b = {
          { 'branch', },
          { 'diff', },
          { 'diagnostics', sources = { 'nvim_lsp' } },
        },
        lualine_c = {
          { 'filename', file_status = true, path = 1 },
        },

        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 }
        }
      }


    },
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",

    }
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = '#000000',
      stages = 'slide',
      fps = 120,

    }
  }
}

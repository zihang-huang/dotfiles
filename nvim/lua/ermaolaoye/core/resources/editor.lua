return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {"mrbjarksen/neo-tree-diagnostics.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
          vim.cmd([[set showtabline=0]])
        end
      end
    end,

    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Neotree Toggle" },
      { "<leader>fT", "<cmd>Neotree float<cr>", desc = "Neotree Float" },
      { "<leader>fl", "<cmd>Neotree left<cr>", desc = "Neotree Left"},
    },

    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      -- color hidden items
      show_hidden_files = true,
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    },

    keys = {
      { "<leader>fw", "<cmd>w!<CR>", "Save" },
      { "<leader>fq", "<cmd>bdelete<CR>", "Quit" }, -- close current buffer
      { "<leader>fQ", "<cmd>q!<CR>", "Quit(Force)"},
      { "<leader>h",  "<cmd>nohlsearch<CR>", "No highlight"},
      { "<leader>fes", "<cmd>source $MYVIMRC<CR>", "Source MYVIMRC"},
      { "<leader>fev", "<cmd>edit $MYVIMRC<CR>", "Edit MYVIMRC"}

    }

  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes_denylist = {
        "neo-tree",
        "dashboard",
        "TelescopePrompt",
        "TelescopeResult",
        "DressingInput",
        "neo-tree-popup",
        "",
      },
      delay = 200,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 
      'nvim-lua/plenary.nvim',
    },

    keys = {
      {"<leader>ff", "<cmd>Telescope find_files<cr>", "Telescope Findfile"},
      {"<leader>fb", "<cmd>Telescope buffers<cr>", "Telescope Buffers"},
      {"<leader>fh", "<cmd>Telescope help_tags<cr>", "Telescope Help tags"},
      {"<leader>fb", "<cmd>Telescope live_grep<cr>", "Telescope Live Grep"},


    },
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20;
      open_mapping = [[<c-\>]],
    },
    config = true,
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal"},
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal Horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Terminal Vertical" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal Window" },
    }
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  }
}

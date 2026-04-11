vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })  -- Open netrw file explorer

-- Visual mode line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })  -- Move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })  -- Move selected lines up

-- Normal mode navigation and search
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines while keeping cursor position" })  -- Join lines while keeping cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down with cursor centered" })  -- Half page down with cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up with cursor centered" })  -- Half page up with cursor centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result with cursor centered" })  -- Next search result with cursor centered
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result with cursor centered" })  -- Previous search result with cursor centered

-- Paste without yanking
vim.keymap.set("x", "<leader>p", [['_dP]], { desc = "Paste over selection without yanking" })  -- Paste over selection without yanking

-- System clipboard operations
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })  -- Yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })  -- Yank line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [['_d]], { desc = "Delete without yanking" })  -- Delete without yanking

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Alternative escape key" })  -- Alternative escape key

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })  -- Disable Ex mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })  -- Open tmux sessionizer

-- Quickfix and location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })  -- Next quickfix item
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })  -- Previous quickfix item
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })  -- Next location list item
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })  -- Previous location list item

vim.keymap.set("n","<leader>B",":b#<CR>", { desc = "Switch to last buffer" })  -- Switch to last buffer

vim.keymap.set("n","<leader>ob",":OldfilesBrowser<CR>", { desc = "Open old files browser" })  -- Open old files browser

-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })  -- Replace word under cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })  -- Make current file executable

vim.keymap.set("n", "<leader>vpp", "<cmd>Explore ~.config/nvim/<CR>", { desc = "Open nvim config folder" })  -- Open nvim config folder

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Run cellular automaton animation" })  -- Run cellular automaton animation

vim.keymap.set("n", "<leader><leader>","<cmd>Telescope<CR>", { desc = "Open Telescope" })  -- Open Telescope

-- LSP & Diagnostic stuff
vim.keymap.set('n', '<leader>ff', function() -- Format and retab current file
  vim.lsp.buf.format()
  vim.cmd('retab')
end, { silent = true, desc = "format buffer then retab"} )
vim.keymap.set("n","<leader>gh",vim.lsp.buf.hover, { desc = "Show LSP hover information" })  -- Show LSP hover information
vim.keymap.set("n","<leader>gl",vim.diagnostic.open_float, { desc = "Show diagnostic information" }) -- show diagnostic information
vim.keymap.set("n","<leader>gd",vim.lsp.buf.definition, { desc = "Jump to definition" }) -- jump to definition

-- Telescope commands
vim.keymap.set("n", "<leader><space>fb", "<cmd>Telescope find_files<CR>", { desc = "Find files" })  -- Find files
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Show git status" })  -- Show git status

vim.keymap.set("n", "<leader>sbt", "<cmd>SidebarNvimToggle<CR>", { desc = "Toggle sidebar" })  -- Toggle sidebar

vim.keymap.set("n", "<leader>gt", '<cmd>tabnew<CR>', { desc = "Open new tab" })  -- Open new tab

vim.keymap.set("n", "<leader>hls", "<cmd>set hlsearch!<CR>", { desc = "Toggle search highlighting" })  -- Toggle search highlighting

-- Harpoon keymaps
local mark = require("harpoon.mark")  -- For marking files
local ui = require("harpoon.ui")      -- For UI and navigation
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add current file to Harpoon list" })  -- Add current file to harpoon list
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show list of marked files" })  -- Show list of marked files
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Navigate to first marked file" })  -- Navigate to first marked file
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Navigate to second marked file" })  -- Navigate to second marked file
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Navigate to third marked file" })  -- Navigate to third marked file
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Navigate to fourth marked file" })  -- Navigate to fourth marked file

-- Telescope keymaps

local builtin = require('telescope.builtin')  -- Load telescope's built-in pickers

-- File finding
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files in current directory" })  -- Find files in current directory
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in git repository" })  -- Find files in git repository

-- Search functionality
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search for text in files (interactive grep)" })  -- Search for text in files (interactive grep)

-- Help and documentation
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Search through help tags" })  -- Search through help tags

-- Fugitive keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open fugitive Git interface" })  -- Open fugitive Git interface

-- Set up fugitive-specific keymaps when entering a fugitive buffer
local Fugitive_group = vim.api.nvim_create_augroup("Fugitive_group", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Fugitive_group,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false, desc = "Git operation"}

        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)  -- Push current branch to remote

        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)  -- Pull and rebase current branch

        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)  -- Push and set upstream branch
    end,
})


-- refactoring keymaps
require('refactoring').setup({})

vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true})


-- QoL



-- trouble keymaps
-- Open Trouble quickfix list
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true, desc = "Open Trouble quickfix list"}
)
-- Open Trouble location list
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true, desc = "Open Trouble location list"}
)
-- Open Trouble document diagnostics
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true, desc = "Open Trouble document diagnostics"}
)

-- Undotree keymaps
-- Open Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open Undotree" })

-- open markdown docs in zathura, with live updates
-- Neovim
--   ↓
-- Pandoc
--   ↓
--  PDF
--   ↓
-- Zathura (auto-reload)
vim.keymap.set("n", "<leader>mp", function()
  vim.cmd("write")  -- ensure file is saved

  local input = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".pdf"

  vim.fn.jobstart({
    "pandoc",
    input,
    "-o",
    output,
    "--pdf-engine=xelatex",
  }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code)
      if code == 0 then
        vim.fn.jobstart({ "zathura", output }, { detach = true })
      else
        vim.notify("Pandoc build failed", vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Markdown preview" })

-- ray-x/go.nvim
vim.keymap.set("n", "<leader>tt", "<cmd>GoTest<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>GoTestFunc<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>GoRun<CR>")
vim.keymap.set("n", "<leader>tb", "<cmd>GoBuild<CR>")
vim.keymap.set("n", "<leader>ti", "<cmd>GoImports<CR>")
vim.keymap.set("n", "<leader>ta", "<cmd>GoAlt<CR>")


vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Open Nvim Tree"  })

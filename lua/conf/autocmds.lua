local augroup = vim.api.nvim_create_augroup
local TheStolenGoodsGroup = augroup('TheStolenGoods', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheStolenGoodsGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Markdown → PDF rebuild
autocmd("BufWritePost", {
    group = TheStolenGoodsGroup,
    pattern = "*.md",
    callback = function()
        local input = vim.fn.expand("%:p")
        if input == "" then return end

        local output = vim.fn.expand("%:p:r") .. ".pdf"

        vim.fn.jobstart({
            "pandoc",
            input,
            "-o",
            output,
            "--pdf-engine=tectonic",
        })
    end,
})

-- Tree sitter gubbins
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then
      -- silently ignore unsupported filetypes
    end
  end,
})

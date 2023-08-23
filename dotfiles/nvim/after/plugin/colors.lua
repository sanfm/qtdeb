function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- For transparency
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- For transparency
end

ColorMyPencils()

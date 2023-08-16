local palette = require("sunburn.palette")

-- convert hsl to hex
local colors = {}
for k, v in pairs(palette) do
    colors[k] = v:hex()
end

return {
    normal = {
        a = { fg = colors.bg_0, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg_0, bg = colors.bg_2 },
        c = { fg = colors.fg_0, bg = colors.bg_1 },
    },
    insert = {
        a = { fg = colors.bg_0, bg = colors.blue, gui = 'bold' },
    },
    visual = {
        a = { fg = colors.bg_0, bg = colors.violet, gui = 'bold' },
    },
    replace = {
        a = { fg = colors.bg_0, bg = colors.red, gui = 'bold' },
    },
    inactive = {
        a = { fg = colors.fg_1, bg = colors.bg_1, gui = 'bold' },
        b = { fg = colors.bg_2, bg = colors.dim_0 },
        c = { fg = colors.bg_2, bg = colors.bg_1 },
    },
    command = {
        a = { bg = colors.br_yellow, fg = colors.bg_0, gui = 'bold' },
    },
}

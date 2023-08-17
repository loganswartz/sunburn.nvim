local oklch = require("polychrome").oklch

-- The palette was chosen in 2 steps:
--
--  1. finding a chroma value and a range of acceptable lightness values
--  2. finding hue values for each of the needed colors.
--
-- The goal of finding a set of lightness and chroma values was to find values
-- that would provide colors inside the sRGB gamut, no matter what hue was
-- chosen, with an upper and lower range of lightness values. By doing this, I
-- could define the normal colors using the lower bound lightness value, and
-- then define the bright versions of those colors using the upper bound
-- lightness value.
--
-- Oklab has strong hue uniformity, so to pick hues, I should ideally be able
-- to find colors that are the most relatively distint by picking equidistant
-- hue values. Doing this means that all other values will arise from my
-- starting value, and any starting value *should* produce a set of values that
-- are perceptually distinct. That being said, if possible, I wanted to pick a
-- starting value that gave me hues closest to what we typically think of as
-- "the main colors".
--
-- To do that, I picked a starting hue which, to my eye, was a "main color" and
-- also encompassed the "smallest relative portion" of the hue range (ie.
-- appears to take up the least space on the hue band). This appeared to be
-- violet, so I settled on a starting value of violet = 295, based on nothing
-- but my subjective taste. I need 8 total colors, so 360 / 8 = 45, meaning the
-- final chosen hues should match this formula:
--
--   h = (45n + 295) % 360
--
-- Where h is the final hue value, and 0 <= n <= 7. The function below handles
-- calculating these values.

local function get_intervals(start, count, max)
    max = max or 360

    start = start % max
    local size = max / count

    local values = {}
    for n = 1, count, 1 do
        local value = ((size * n) + start) % max
        table.insert(values, value)
    end

    table.sort(values)
    return values
end

local LC = {
    base = {
        LIGHTNESS = 0.65,
        LIGHTNESS_OFFSET = 0.126,
        CHROMA = 0.11,
    },
    -- alternatively, for a slightly brighter base set (but also less difference
    -- between the base and bright colors):
    bright = {
        LIGHTNESS = 0.706,
        LIGHTNESS_OFFSET = 0.068,
        CHROMA = 0.12,
    },
}

---@param size 6|8|nil
---@param bright boolean|nil
local function generate(size, bright)
    local start = size == 8 and 295 or 25
    local hues = get_intervals(start, size)
    local variant = bright and 'bright' or 'base'

    local palette = {
        bg_0  = oklch(0.21, 0, 0),
        bg_1  = oklch(0.28, 0, 0),
        bg_2  = oklch(0.35, 0, 0),
        dim_0 = oklch(LC[variant].LIGHTNESS - LC[variant].LIGHTNESS_OFFSET, 0, 0),
        -- subjective adjustment for white
        fg_0  = oklch(LC[variant].LIGHTNESS + (LC[variant].LIGHTNESS_OFFSET / 3), 0, 0),
        fg_1  = oklch(0.90, 0, 0),
    }

    local NAME_LOOKUP = {
        'red',
        'yellow',
        'green',
        'cyan',
        'blue',
        'magenta',
    }
    if size == 8 then
        table.insert(NAME_LOOKUP, 2, 'orange')
        table.insert(NAME_LOOKUP, 7, 'violet')
    end

    for idx, hue in ipairs(hues) do
        local name = NAME_LOOKUP[idx]
        palette[name] = oklch(LC[variant].LIGHTNESS, LC[variant].CHROMA, hue)
        palette['br_' .. name] = oklch(LC[variant].LIGHTNESS + LC[variant].LIGHTNESS_OFFSET, LC[variant].CHROMA,
            hue)
    end

    return palette
end

local size = vim.g.sunburn_palette_size or 8
local bright = vim.g.sunburn_bright_variant == nil and false or vim.g.sunburn_bright_variant

return generate(size, bright)

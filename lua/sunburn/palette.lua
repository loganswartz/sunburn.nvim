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
-- Where h is the final hue value, and 0 <= n <= 7.

local BASE_LIGHTNESS = 0.65
local BR_LIGHTNESS_OFFSET = 0.126
local BASE_CHROMA = 0.11

-- alternatively, for a slightly brighter base set (but also less difference
-- between the base and bright colors):
--
-- local BASE_LIGHTNESS = 0.706
-- local BR_LIGHTNESS_OFFSET = 0.068
-- local BASE_CHROMA = 0.12

-- difference between each hue is 45
local BASE_HUES = {
    red     = 25,
    orange  = 70,
    yellow  = 115,
    green   = 160,
    cyan    = 205,
    blue    = 250,
    violet  = 295,
    magenta = 340,
}

local palette = {
    bg_0  = oklch(0.21, 0, 0),
    bg_1  = oklch(0.28, 0, 0),
    bg_2  = oklch(0.35, 0, 0),
    dim_0 = oklch(BASE_LIGHTNESS - BR_LIGHTNESS_OFFSET, 0, 0),
    -- subjective adjustment for white
    fg_0  = oklch(BASE_LIGHTNESS + (BR_LIGHTNESS_OFFSET / 3), 0, 0),
    fg_1  = oklch(0.90, 0, 0),
}

for name, hue in pairs(BASE_HUES) do
    palette[name] = oklch(BASE_LIGHTNESS, BASE_CHROMA, hue)
    palette['br_' .. name] = oklch(BASE_LIGHTNESS + BR_LIGHTNESS_OFFSET, BASE_CHROMA, hue)
end

return palette

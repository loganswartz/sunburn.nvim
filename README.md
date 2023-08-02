# sunburn.nvim

A Neovim colorscheme emphasizing readability above all else.

![Example of the
colorscheme](https://loganswartz.com/images/sunburn.nvim/preview.png)

## Usage

This colorscheme uses my own experimental Neovim colorscheme framework,
[polychrome.nvim](https://github.com/loganswartz/polychrome.nvim), so you'll
need to install that in addition to this plugin.

Using packer.nvim:

```lua
use {
    'loganswartz/sunburn.nvim',
    requires = { 'loganswartz/polychrome.nvim' },
}
```

Using Vim-Plug:

```vim
Plug 'loganswartz/polychrome.nvim'
Plug 'loganswartz/sunburn.nvim'
```

Then, somewhere in your vimrc:

```vim
colorscheme sunburn
```

## About

A lot of colorschemes use palettes that have very different perceptual
brightness levels, leading to certain colors being harder to read and others
being almost glaring to the eye. The main goals I had in mind when designing
this colorscheme were that the colors should all have these properties:

* The same perceptual brightness (no one color should "jump out" more)
* A distinct and unique hue (ie. can't be easily confused with each other)

To accomplish this, I used the Oklab colorspace, which is a fairly new
colorspace that is meant to map values to human perception as closely as
possible. That made it very easy to formulate a palette that has the same
perceptual brightness and doesn't change hues when being brightened.

The colorscheme more or less emerged on its own from the combination of these
restrictions. Technically, the colorscheme is currently formulated using Oklch,
which is a transformation of the Oklab colorspace, and I used
[oklch.com](https://oklch.com) to find and tweak the values.

Due to how human vision works, the perception of a hue at a certain brightness
may be representable on a typical computer screen via sRGB, but a different hue
at the same brightness will be completely outside the sRGB space. This means
that the value has to be clipped to the closest sRGB value, which then doesn't
look like the same hue and/or brightness.

To formulate the palette, I looked for a band of brightness values, where
(nearly) every hue in that band could be displayed at the maximum and minimum
brightness values of the band without *any* distortion. This immediately dropped
the perceptible "saturation" quite a bit, but gave me a good baseline. Finding
this band means that I can have the base colors use the minimum brightness value
of the band, and have the bright variants of the colors use the brightness value
of the band, hypothetically without any distortion of the perceived hue.

Once I found a good band, I picked the most distinct hues based on the peaks and
troughs of the chroma and hue graphs in the color picker, with some very minor
manual adjustment for personal preference and better distinction in some colors
that appear a bit close to each other. I'll probably tweak these values slightly
in the future, as the green-yellow and orange-red pairs are still a little
problematic.

## Misc

### Lualine

If you use Lualine, it should automatically pick up the theme when you activate
it.

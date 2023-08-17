#!/usr/bin/env python3

import subprocess
import json
from rich.text import Text
from rich.console import Console
from rich.panel import Panel
from rich.rule import Rule
from rich.padding import Padding
from rich.console import group

BLOCK = '█'*5

NAME = r"""
                              $$\
                              $$ |
 $$$$$$$\ $$\   $$\ $$$$$$$\  $$$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$\
$$  _____|$$ |  $$ |$$  __$$\ $$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\
\$$$$$$\  $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  \__|$$ |  $$ |
 \____$$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |      $$ |  $$ |
$$$$$$$  |\$$$$$$  |$$ |  $$ |$$$$$$$  |\$$$$$$  |$$ |      $$ |  $$ |
\_______/  \______/ \__|  \__|\_______/  \______/ \__|      \__|  \__|

"""

def get_palettes(size = 8):
    palettes = {
        'base': {},
        'bright': {},
        'grayscale': {},
    }

    dump = subprocess.check_output(['nvim', '-u', 'NONE', '--headless', f"""+lua
    local generate = require("sunburn.palette").generate
    local mapped = vim.tbl_map(function (color) return color:hex() end, generate({size}))
    print(vim.fn.json_encode(mapped))
    """, '+q'], stderr=subprocess.STDOUT, text=True)

    exported = json.loads(dump)
    main = ['red', 'orange', 'yellow', 'green', 'cyan', 'blue', 'violet', 'magenta']
    grayscale = ['bg_0', 'bg_1', 'bg_2', 'dim_0', 'fg_0', 'fg_1']

    for name in main:
        color = exported.get(name)
        if color is not None:
            palettes['base'][name] = color
            palettes['bright'][name] = exported['br_' + name]

    for name in grayscale:
        palettes['grayscale'][name] = exported[name]

    return palettes

def color_row(palettes, group = 'base'):
    color_row = [(('' if idx == 0 else ' ') + BLOCK, color) for idx, color in enumerate(palettes[group].values())]
    return Text.assemble(*color_row, justify='center')

def name_row(palettes):
    return Text(NAME, style=palettes['grayscale']['fg_0'])

@group()
def get_panels(palettes):
    yield name_row(palettes)
    yield Text('A colorscheme for ultimate readability', justify="center")
    yield Text('Author: Logan Swartzendruber\n', style=palettes['grayscale']['dim_0'], justify="center")
    yield Rule(Text('8 Colors', style=None), style=palettes['grayscale']['dim_0'])
    yield Text()
    yield color_row(palettes)
    """ yield color_row(palettes, 'bright') """
    yield Text()

    yield color_row(palettes, 'grayscale')
    yield Text()

    palettes = get_palettes(6)
    del palettes['grayscale']['bg_0']

    yield Rule(Text('6 Colors', style=None), style=palettes['grayscale']['dim_0'])
    yield Text()
    yield color_row(palettes)
    """ yield color_row(palettes, 'bright') """
    yield Text()
    yield color_row(palettes, 'grayscale')
    yield Text()

def main():
    palettes = get_palettes()
    bg = palettes['grayscale']['bg_0']
    del palettes['grayscale']['bg_0']

    console = Console(color_system="truecolor")
    console.print(Panel.fit(Padding(get_panels(palettes), (1, 5))), style='on ' + bg)

if __name__ == "__main__":
    main()

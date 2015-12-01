# selectbycolor.vim

selectbycolor.vim is a simple plugin that provides mappings to select lines of
text according to their color.

It provides the following visual selection and operator objects:

* `ic` - inner color: select all cohesive lines with the same color as the
  character under the cursor (the relevant character is the character in the
  same column as the cursor)
* `oc` - outer color: same as `ic`, but select one line additionally at the
  start and end

## Installation

I recommend using [pathogen.vim](https://github.com/tpope/vim-pathogen):

    cd ~/.vim/bundle
    git clone git://github.com/andrmuel/vim-selectbycolor.git

## License

Feel free to use this plugin under GNU GPL conditions.

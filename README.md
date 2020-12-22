# My basic .vimrc config

This is my basic vim configuration. It is meant to start up instantly, and have just the right stuff I need to (mostly) code in Rust.

It has a nice color scheme, lightline, YCM with rust-analyzer hooked in, and a few other tweaks.

### Setting up

Install vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install nodejs (this will probably be not necessary later on):
`curl -sL install-node.now.sh/lts | bash`

Copy the config:

```
cp vimrc ~/.vimrc
```

Run vim, ignore errors, and call `:PlugInstall`

Afterwards, run `:CocInstall coc-rust-analyzer` for Rust support


### Bindings?

AutoPairs FastWrap, and BackInsert were rebound to use the Control key, as opposed to Meta (Alt). 

Leader-B (`\B`) shows git-blame summary.

Auto completion was made to be completed using TAB key.

Some extra CoC configuration for normal mode:

- gd - go to definition
- gy - go to type definition
- gi - go to implementation
- gr - print references
- K - show docs

NerdTREE stuff is straight up C+P from their README:

- Leader-N - NerdTREEFocus
- `C-n` - NerdTREE
- `C-t` - NerdTREEToggle
- `C-f` - NerdTREEFind

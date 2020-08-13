# My basic .vimrc config

This is my basic vim configuration. It is meant to start up instantly, and have just the right stuff I need to (mostly) code in Rust.

It has a nice color scheme, lightline, YCM with rust-analyzer hooked in, and a few other tweaks.

### Setting up

Install vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install rust-analyzer (the line below is for Linux):

```
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

Copy the config:

```
cp vimrc ~/.vimrc
```

Run vim, ignore errors, and call `:PlugInstall`


### Bindings?

Basically, `\D` is supposed to show docs on the selected item in the code. I didn't have it on hover, because I use terminal vim, and having it show all the time was a bit too much for me.

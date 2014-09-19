tmux-zoom
=========

Now you can maximize your tmux pane into a full window, and can zoom it back in to its original window/pane.


Instructions
---------------------
1. Copy this file to ~/bin/tmux-zoom.sh

2. Add the below line to ~/.tmux.conf
  unbind x
  bind x run ". ~/bin/zoom"

Now press Prefix-Key + x to zoom in tmux.
To zoom back again press Prefix-Key + x from the zoomed window in tmux.

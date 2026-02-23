#!/usr/bin/env nix-shell

#! nix-shell -i bash --pure
#! nix-shell -p bash dconf dconf2nix nodejs_24

dconf dump / > dconf.settings
node ./cleanUpDconf.js
cat dconf.settings | dconf2nix -i dconf.settings -o dconf.gen.nix
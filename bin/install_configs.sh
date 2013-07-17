#!/bin/sh
echo "Installing configs for $(hostname)";

mv -f ~/.bashrc ~/.bashrc.org > /dev/null 2>&1;
mv -f ~/.bash_profile ~/.bash_profile.org > /dev/null 2>&1;
ln -s ~/github/dot.config/bash/dot.bashrc ~/.bashrc;
ln -s ~/github/dot.config/bash/dot.bash_profile ~/.bash_profile;

touch ~/.bash_profile.priv;
touch ~/.bashrc.priv;

mv -f ~/.emacs ~/.emacs.org > /dev/null 2>&1;
mv -f ~/.emacs.d ~/.emacs.org > /dev/null 2>&1;
ln -s ~/github/dot.config/emacs.d/dot.emacs ~/.emacs;
ln -s ~/github/dot.config/emacs.d/ ~/.emacs.d;

echo "Please relogin for configurations to be reloaded.";
exit 0;

Dotfiles
========

My useful dotfiles.

This is what I use in my day to day life, I intend to update these from time to time, and accept improvements gladly.

Install
-------
Clone this repo:
```
git clone https://github.com/mamoit/dotfiles.git
```

Bootstrap it!
```
cd dotfiles
. bootstrap.sh
```

Configurations
--------------

This table sums up what each file does, and gives you a hint on how to proceed
with further customization of your own.

File          | Usage
--------------|--------
.bash_aliases | Command aliases (because everybody is lazy)
.bash_profile | Sources the other files, edit it if you want to add extra files to this set
.bash_prompt  | Bash prompt colors, completions and whatnot
.bashrc       | Entry point for all the other files, no need to change this
.exports      | Some local variables
.extras       | Name says it all, anything that is local and should not be commited
.functions    | Bash functions
.gitconfig    | Git configuration
.motd         | Message of the day to be printed on opening bash
.path         | Folders to be included in the path
.vimrc        | Vim customization

Notes
-----
The bootstraper **will overwrite** your already existent dotfiles!

If you want to preserve any of your current configs or custom tweaks make sure you backup your dotfiles and/or patch this repo locally.

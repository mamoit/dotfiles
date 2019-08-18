#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

function doIt() {
	testGit
	rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "README.md"\
		 -avh --no-perms home/ ~;
	source ~/.bash_profile;
}

function testGit() {
	if [ -f ~/.gitconfig ]; then
		name=`grep name ~/.gitconfig | sed -E 's/.*=\s*(.*)$/\1/g'`
		email=`grep email ~/.gitconfig | sed -E 's/.*=\s*(.*)$/\1/g'`

		if [[ $email =~ "" && $name =~ "" ]]; then
			echo "WARNING: assuming $email as the default email for GIT (you may change it on your ~/.gitconfig)"
			sed -i "s/NAMEPLACEHOLDER/$name/g" home/.gitconfig
			sed -i "s/EMAILPLACEHOLDER/$email/g" home/.gitconfig
			return
		fi
	fi

	echo "Input new name to use"
	read name
	sed -i "s/NAMEPLACEHOLDER/$name/g" home/.gitconfig

	echo "Input new email to use"
	read email
	sed -i "s/EMAILPLACEHOLDER/$email/g" home/.gitconfig
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;

unset doIt;
unset testGit;

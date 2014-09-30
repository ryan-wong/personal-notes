#Sublime Text
 ```sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/sbl```


#Sublime Packages to get
 ```
 {
	"installed_packages":
	[
		"Emmet",
		"Git",
		"Gitignore",
		"Jade",
		"Jade Build",
		"Jedi - Python autocompletion",
		"JSLint",
		"Markdown Preview",
		"Pylinter",
		"Python Flake8 Lint",
		"Sass",
		"SideBarGit",
		"SublimeGit",
		"SublimeLinter",
		"SublimeLinter-pylint",
		"SublimePythonIDE"
	]
}
```

#homebrew
```
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
brew update
sudo chown $USER /usr/local
brew update
brew install bash-completion byobu ssh-copy-id wget
```

#Setup Python
```
sudo easy_install pip
brew install python3
brew link apps
pip install virtualenv
Add to .bashrc
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
source ~/.bashrc
source ~/.bash_profile
Only install something with pip and specify python environment
virtualenv -p python3 foldername
. bin/activate
```

#postgresql
```
sudo xcodebuild -license
brew install postgresql
brew postinstall postgresql
postgres -D /usr/local/var/postgres
/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -h localhost
```
#Mac OS keybinding
Move Back a keyword ``` Alt -> ALT <-```

End ```Command <- Command ->```

Command ```2nd window key```

Switch desktop screen ```Ctrl -> Ctrl <-```

Copy Terminal ```Command C```

Paste Terminal ```Command V```

#List of Stuff to install
```
sudo gem install sass
sudo gem install compass
ulimit -n 10000
```

#Compass
```
compass create <my-project>
```

#Nodejs
```

```
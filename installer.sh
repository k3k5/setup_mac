#! /usr/bin/sh

xcode-select --install

# SSH Key generieren
echo "Generiere SSH-Key"
echo "Um den public key zu kopieren, führe `pbcopy < ~/.ssh/id_rsa.pub` aus."
echo "!!!!! Teile NIEMALS den private key !!!!!!"
ssh-keygen -t rsa

echo "Installiere Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update
brew install git
git --version

echo "Installiere brew cask"
brew tap caskroom/cask

echo "Installiere UNIX-Utilities"
brew install -r brew_list.txt

echo "Removing all items from Dock"
dockutil --remove all

# Ruby, RVM
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
type rvm | head -1
rvm -v
echo "RVM Version should be higher than 1.26.10"
sleep 3s
ruby -v
echo "Ruby Version should be higher than 2.2.0. If not, please run `rvm reinstall 2.2.0 --disable-binary`"
sleep 3s

# Development Libraries and Languages
echo "Installiere Python"
brew install python
python --version

echo "Installiere Python Packages"
pip3 install -r requirements.txt
echo "Folgende Packages wurden installiert:"
pip3 list
sleep 7s

echo "Installiere NodeJS"
brew install node
node -v
npm -v

sleep 3s


echo "Installire ohmyzsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "Please use 'ys' as ZSH_THEME!"
echo "You can adjust it with `vim ~/.zshrc`."
sleep 3s
# =========== START ZSH CONFIG ===========
echo "Please add some aliases to fasten up development ..."
echo "For the start, we are providing some. You can take a look at them with command zshconfig."

echo 'alias zshconfig="mate ~/.zshrc"' >> ~/.zshrc
echo 'alias ohmyzsh="mate ~/.oh-my-zsh"' >> ~/.zshrc
echo 'alias ssh_staging="ssh -i /Users/Keks/.ssh/id_rsa eun-staging1.wavecloud.de -l sebastian"' >> ~/.zshrc
echo 'alias run_docker="docker-compose down;docker-compose build;docker-compose up"' >> ~/.zshrc
echo 'alias run_docker_d="docker-compose down;docker-compose build;docker-compose up -d"' >> ~/.zshrc
echo 'alias good_night="sudo shutdown -h now"' >> ~/.zshrc
echo 'alias dcb="docker-compose down;docker-compose build;docker-compose up"' >> ~/.zshrc
echo 'alias mkcd="foo(){ mkdir -p "$1"; cd "$1" }; foo "' >> ~/.zshrc
echo 'alias myip="curl http://ipecho.net/plain; echo"' >> ~/.zshrc
echo 'alias ll="ls -la"' >> ~/.zshrc
echo 'alias l.="ls -d .* --color=auto"' >> ~/.zshrc
## pass options to free ##
echo 'alias meminfo="free -m -l -t"' >> ~/.zshrc

## get top process eating memory
echo 'alias psmem="ps auxf | sort -nr -k 4"' >> ~/.zshrc
echo 'alias psmem10="ps auxf | sort -nr -k 4 | head -10"' >> ~/.zshrc

## get top process eating cpu ##
echo 'alias pscpu="ps auxf | sort -nr -k 3"' >> ~/.zshrc
echo 'alias pscpu10="ps auxf | sort -nr -k 3 | head -10"' >> ~/.zshrc

## Get server cpu info ##
echo 'alias cpuinfo="lscpu"' >> ~/.zshrc

## get GPU ram on desktop / laptop##
echo 'alias gpumeminfo="grep -i --color memory /var/log/Xorg.0.log"' >> ~/.zshrc

echo 'alias cl="fc -e -|pbcopy"' >> ~/.zshrc
# =========== END ZSH CONFIG ===========

echo "Installiere iTerm2"
brew cask install iterm2

echo "Installiere Google Chrome"
brew cask install google-chrome

echo "Installiere Firefox"
brew cask install firefox

echo "Installiere Microsoft Office"
brew cask install microsoft-office

echo "Installiere Slack"
brew cask install slack

echo "Installiere Postman"
brew cask install postman

echo "Installiere Balsamiq Mockups"
brew cask install balsamiq-mockups

echo "Installiere Dashlane"
brew cask install dashlane

echo "Installiere JetBrains Stuff – PyCharm, PhpStorm, WebStorm"
brew cask install pycharm
brew cask install phpstorm
brew cask install webstorm

echo "Installiere Visual Studio Code"
brew cask install visual-studio-code

echo "Installiere MongoDB Compass"
brew cask install mongodb-compass

echo "Installiere Docker"
brew cask install docker

echo "Installiere Adobe CC"
brew cask install adobe-creative-cloud

echo "Installiere Telegram"
brew cask install telegram-desktop

echo "Installiere WhatsApp"
brew cask install whatsapp

echo "Installiere Spotify"
brew cask install spotify
brew cask install spotify-notifications

echo "Installiere MAMP"
brew cask install mamp

echo "Konfiguration des Mac startet ..."
# Kopieren der Bilddateien
cp -r Images_Copy/ ~/Pictures/

# Kopieren der Dokumente
cp -r Documents_Copy/ ~/Documents/

# Hier weitere Installationen

echo "Installationen und Konfigurationen erfolgreich abgeschlossen"
echo "Viel Spaß mit dem Mac!"
echo "$(cat banner.txt)"

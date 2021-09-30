# General Laptop Setup
Laptop configuration reminders for setting up a new work laptop.


## 1. Download all non project specific tools.
- IntelliJ
- Slack (unshovel, prism, wwcode, hubspot)
- Atom (dont forget to link to setup command line call `ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom`)
- [Brew](https://brew.sh/) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Spotify
- Postman
- Chrome
- [Flux](https://justgetflux.com/)


## 2. Add Fave Chrome Bookmarks
- Calendar
- Gmail
- Gdrive
- Github Org
- Github Open Prs: [Sample Query](https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3Abriaugenreich)
- Story tracking
- Monitoring/Alerting
- Cloud Account
- Shortcuts folder cheat sheets to it (slack, github, terminal, mac)

## 3. Customize dock & screen rendering
## 4. Setup Internal Notes Repo
## 5. Setup Bluetooth Devices

## 6. View hidden files in finder
  1. Open terminal
  2. ```defaults write com.apple.finder AppleShowAllFiles YES```

## 7. Customize command line and profiles
- Terminal font + color customization
- [Git Completion](https://git-scm.com/book/id/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh) `autoload -Uz compinit && compinit` **_might not need this with oh my zsh... wait until after installed_**
- [ZSH](https://github.com/ohmyzsh/ohmyzsh) configured


  ```
  zsh --version
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # set up in szh.rc
  ZSH_THEME="minimal"  # or apple or robbyrussell

  # install plugins https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins

  plugins=(
    git
    aws
    docker
  )

  # fave aliases
  alias ll='ls -la'
  alias tf='terraform'
  alias java8="export JAVA_HOME=$JAVA8"
  alias java15="export JAVA_HOME=$JAVA15"

  # default to Java 8
  java8
  ```

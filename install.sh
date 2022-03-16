if [ $# == 1 ] && [ $1 == "full" ]; then
  echo "Full install "
elif [ $# == 1 ] && [ $1 == "cli" ]; then
  echo "Client install"
else
  echo "Usage: $0 [full|cli]"
  exit;
fi

if [ -x "$(command -v apt-get)" ]; then
  echo "Installing using apt-get"
  sudo apt-get install vim zsh git stow
  if [ $1 == "full" ]; then
    sudo apt-get install xscreensaver rxvt-unicode unclutter firefox compton
  fi
elif [ -x "$(command -v yum)" ]; then
  echo "Installing using yum"
  sudo zypper install zsh git vim stow
  if [ $1 == "full" ]; then
    sudo yum install xscreensaver rxvt-unicode unclutter firefox compton
  fi
else
  echo "No supported package manager installed!"
fi

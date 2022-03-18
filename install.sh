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
  sudo apt-get install -y vim zsh git stow
  if [ $1 == "full" ]; then
    sudo apt-get install -y xscreensaver rxvt-unicode unclutter firefox compton
  fi
elif [ -x "$(command -v yum)" ]; then
  echo "Installing using yum"
  sudo yum install -y zsh git vim stow nano
  if [ $1 == "full" ]; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update
    sudo dnf install -y code
    sudo yum check-update
    sudo yum install -y xscreensaver rxvt-unicode firefox compton
  fi
else
  echo "No supported package manager installed!"
fi

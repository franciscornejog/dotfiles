echo 'Uninstalling Xcode Command Line Tools...'
sudo rm -rf /Library/Developer/CommandLineTools

echo 'Uninstalling Homebrew...'
if test $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi


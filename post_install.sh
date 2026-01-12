#!/usr/bin/bash

# Post-install script for dotfiles setup
# Installs packages listed in README.md if not already installed

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if package is installed
is_installed() {
    pacman -Qi "$1" &> /dev/null
}

# Function to install package if not already installed
install_if_missing() {
    local package="$1"
    if is_installed "$package"; then
        print_status "$package is already installed"
    else
        print_warning "Installing $package..."
        sudo pacman -S --noconfirm "$package"
    fi
}

# Function to install AUR package if not already installed
install_aur_if_missing() {
    local package="$1"
    if is_installed "$package"; then
        print_status "$package is already installed"
    else
        print_warning "Installing AUR package $package..."
        yay -S --noconfirm "$package"
    fi
}

print_status "Starting package installation..."

# Check if yay is installed for AUR packages
if ! command -v yay &> /dev/null; then
    print_error "yay is not installed. Please install yay first for AUR packages."
    exit 1
fi

# Official repository packages
packages=(
    "yt-dlp"
    "qutebrowser"
    "zotero"
    "tmux"
    "texlive-latexrecommended"
    "texlive-latex"
    "texlive-fontsrecommended"
    "texlive-fontsextra"
    "texlive-basic"
    "stow"
    "python-adblock"
    "pandoc-cli"
    "nvtop"
    "btop"
    "guitarix"
    "dbeaver"
    "bitwarden"
    "rbw"
)

# AUR packages
aur_packages=(
    "texpresso-git"
    "vesktop"
)

print_status "Installing official repository packages..."
for package in "${packages[@]}"; do
    install_if_missing "$package"
done

print_status "Installing AUR packages..."
for package in "${aur_packages[@]}"; do
    install_aur_if_missing "$package"
done

print_status "Package installation complete!"

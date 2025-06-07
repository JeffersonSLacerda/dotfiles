#!/bin/bash
set -e

# Configurações básicas de shell
cat ./.gitconfig >> /home/node/.gitconfig

# Instalação do Oh My Zsh
RUNZSH=no CHSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instala plugins essenciais
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configuração básica do Zsh
cp ./.zshrc ~
sed -i '/^ZSH_THEME/c\ZSH_THEME="refined"' ~/.zshrc

# Configuração de fontes (execução em background)
(
    git clone https://github.com/powerline/fonts.git /tmp/fonts
    cd /tmp/fonts
    ./install.sh
    cd ..
    rm -rf /tmp/fonts
) > /dev/null 2>&1 &

echo "Configuração básica do ambiente concluída!"

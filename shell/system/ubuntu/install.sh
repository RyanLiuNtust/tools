sudo apt-get update

# download chrome https://www.google.com.tw/chrome/browser/desktop/#
# sudo dpkg -i chrome.deb file
sudo apt-get install -y git 
git config --global alias.co checkout
git config --global alias.bra branch 
git config --global alias.st status 
sudo apt-get install tig

sudo apt-get install -y vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vim/.vimrc ~/
mkdir -p .vim/colors
cp vim/ir_black.vim ~/.vim/colors
vim +PluginInstall

sudo apt-get install -y tmux 
cp tmux/.tmux.conf ~/
tmux source-file ~/.tmux.conf

sudo apt-get install -y guake

cp bash/.bashrc ~/
sudo apt-get install -y autojump
source ~/.bashrc

sudo apt-get install -y ipython
sudo apt-get install python-pip python-dev

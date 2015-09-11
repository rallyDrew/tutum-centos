git clone https://github.com/RallySoftware/oh-my-zsh-custom.git ~/.oh-my-zsh-custom
cp ~/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.51-1.b16.el7_1.x86_64" >> ~/.zshrc
source ~/.zshrc
ln -s $JAVA_HOME /usr/lib/jvm/java-8-oracle
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
mkdir ~/projects
cd ~/projects
git clone https://github.com/rallysoftware/alm
cd alm
cd alm-webapp
bundle install
npm install
npm install moment
./gradlew

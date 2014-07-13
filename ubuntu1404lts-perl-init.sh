#!/usr/bin/env bash


#aptitude update
aptitude install -y build-essential
aptitude install -y git
aptitude install -y vim
aptitude install -y perlbrew
aptitude install -y cpanminus
aptitude install -y perl-doc
apt-get -y install debconf-utils
# makepasswd
aptitude install -y whois
aptitude install -y makepasswd

echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

aptitude install -y mysql-server
aptitude install -y mysql-client
aptitude install -y zsh
chsh -s /usr/bin/zsh vagrant
mv ~/.zshrc ~/.zshrc.orig
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# for DBD
aptitude install -y libmysqlclient-dev



# vim
aptitude install -y vim
# vim setting
mkdir ~/GitSettings
cd ~/GitSettings
git clone https://github.com/ktotoron/PerlSettings.git
cd ~
ln -s ~/GitSettings/PerlSettings/.vimrc ~/.vimrc

mkdir ~/.vim
cd ~/.vim
git clone git://github.com/gmarik/vundle.git vundle
cd ~

# vim command
vim +":BundleInstall" +:q




#    # --------------------user--------------------
#    # user add
#    groupadd perl_dev
#    useradd -m -G perl_dev -p `echo 'test' | mkpasswd -s -m sha-512` totoron_perl
#    
#    # perl
#    su -l totoron_perl
#    # --------------------user--------------------

#perlbrew setting 
perlbrew init
echo 'source ~/.perlbrew/etc/bashrc' >> ~/.bashrc
source ~/.bashrc
perlbrew install-cpanm


# catalyst
cpanm local::lib

cpanm YAML
cpanm Catalyst::Runtime
cpanm Catalyst::Devel

cpanm Catalyst::View::TT
cpanm --force Catalyst::View::JSON

cpanm Catalyst::Model::DBIC::Schema
ln -s /usr/bin/mysql_config /usr/local/bin/mysql_config
cpanm --force DBD::mysql
cpanm DateTime::Format::MySQL
cpanm Catalyst::Model::DBI
cpanm Catalyst::Model::Adaptor
cpanm DBIx::Class::Cursor::Cached

cpanm Catalyst::Plugin::Session
cpanm Catalyst::Plugin::Session::State::Cookie
cpanm Catalyst::Plugin::Session::Store::File
cpanm Catalyst::Plugin::Authentication
cpanm Catalyst::Authentication::Store::DBIx::Class
cpanm Catalyst::Plugin::Authorization::Roles
cpanm Catalyst::Plugin::FormValidator::Simple
cpanm Catalyst::Plugin::FormValidator::Simple::Auto
cpanm --force FormValidator::Simple::Plugin::Japanese
cpanm Catalyst::Plugin::Cache
cpanm Catalyst::Plugin::PageCache
cpanm Catalyst::Plugin::I18N

cpanm Catalyst::Controller::ActionRole
cpanm --force XML::SAX::Expat
cpanm --force XML::Parser
cpanm --force XML::Simple
cpanm Test::Base
cpanm Test::Pod::Coverage
cpanm Moose



# MySQL
# GRANT ALL PRIVILEGES ON cataldb.* TO 'cataluser'@'localhost' IDENTIFIED BY 'catalpass';
# create database cataldb;





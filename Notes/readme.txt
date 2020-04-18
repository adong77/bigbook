#Git:
 sudo apt-get install git -y
#Nodejs:
 curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
 sudo apt-get install nodejs
 node -v #v9.3.0
 npm -v  #v5.5.1
#Hexo:
 sudo npm install hexo-cli -g
 //hexo-cli是hexo的命令行模式, CLI=Command Line Interface
 hexo --version #v1.0.4
 
#WSL
cd /mnt/c/
hexo init Hexo  //其中 Hexo 是自己定义的博客根目录名称，如hexo init myblog
cd Hexo/
 
#Hexo组件：
 sudo npm install hexo-deployer-git --save
 //可使用命令hexo d 部署到github上
 sudo npm install hexo-server --save
 sudo npm install hexo-generator-sitemap --save
 sudo npm install hexo-generator-feed --save

# theme
$ git clone https://github.com/tufu9441/maupassant-hexo.git themes/maupassant
$ npm install hexo-renderer-pug --save
$ npm install hexo-renderer-sass --save

# github
ssh -T git@github.com
git config --global user.name "adong77"
git config --global user.email "youdng@hotmail.com"

# gitbook
$ sudo npm config set registry https://registry.npm.taobao.org/
$ npm install gitbook-cli -g
$ gitbook build ./gitbook/ docs/


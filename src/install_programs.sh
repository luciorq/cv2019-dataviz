sudo apt-get update

sudo apt-get install \
  htop \
  gdebi-core \
  imagemagick


RSTUDIO_VERSION=1.2.1256
wget https://s3.amazonaws.com/rstudio-ide-build/server/debian9/x86_64/rstudio-server-$RSTUDIO_VERSION-amd64.deb




sudo gdebi rstudio-server-$RSTUDIO_VERSION-amd64.deb
ls

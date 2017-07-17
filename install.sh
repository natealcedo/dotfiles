#!/bin/bash

USER=`whoami`
# echo "Creating ~/opt directory..."
# cd ~ && mkdir opt
# echo "Installing essential libraries"
# echo "====================================="

sudo apt install build-essential cmake pkg-config curl git mercurial iotop libreadline-dev libbz2-dev libncurses5-dev libssl-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev dpkg-dev texinfo automake libtool cmake libgeos-dev  libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev gfortran libopenblas-dev liblapack-dev libevent-dev libpq-dev libxml2-dev libxslt1-dev libffi-dev libcurl4-openssl-dev libbz2-1.0 libbz2-dev libbz2-ocaml libbz2-ocaml-dev libgs-dev ghostscript libjpeg-dev libtiff5-dev libpng12-dev zlib1g-dev libtiff5 libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran
sudo apt install libcurl4-gnutls-dev

echo "Installing pyenv"
echo "====================================="
cd ~/opt && git clone git://github.com/yyuu/pyenv.git
echo "Install python 2.7.13"
export PYENV_ROOT=/home/$USER/opt/pyenv && export PATH=$PYENV_ROOT/bin:$PATH && eval "$(pyenv init -)" && export CONFIGURE_OPTS="--enable-shared" && export LD_LIBRARY_PATH=$PYENV_ROOT/versions/2.7.13/lib:$LD_LIBRARY_PATH && pyenv install 2.7.13

echo "Adding pyenv variables into .profile"
echo "====================================="
echo "export PYENV_ROOT=/home/$USER/opt/pyenv" >> ~/.profile
echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> ~/.profile
echo 'eval "$(pyenv init -)" ' >> ~/.profile
echo "echo \"Using python ...\"" >> ~/.profile
echo 'pyenv version' >> ~/.profile
echo "" >> ~/.profile
echo 'export LD_LIBRARY_PATH=/home/$USER/opt/pyenv/versions/2.7.13/lib:$LD_LIBRARY_PATH' >> ~/.profile
pyenv local 2.7.13
echo "Installing Python dependencies"
echo "====================================="
pip install --upgrade pip
pip install numpy lxml pyenchant scipy service_identity pycurl pillow wheel scrypt

echo "Installing 3rd party libraries"
echo "====================================="

echo "Installing Imagemick (ver 7,*)"
echo "====================================="
cd ~/Downloads/; curl -LO https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvfz ImageMagick.tar.gz -C ImageMagick --strip-components=1 && cd ImageMagick
./configure --prefix=/home/$USER/opt/ImageMagick; make install
ln -s ImageMagick imagemagick

echo "Installing ver( 2.*)"
echo "====================================="
cd ~/Downloads/; curl -LO https://github.com/opencv/opencv/archive/2.4.13.2.tar.gz
tar xvfz 2.4.13.2.tar.gz; cd ~/Downloads/opencv-2.4.13.2; mkdir build; cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/home/$USER/opt/opencv-2.4.13.2 \
  -D INSTALL_PYTHON_EXAMPLES=ON \
  -D INSTALL_C_EXAMPLES=OFF \
  -D PYTHON_EXECUTABLE=/home/$USER/opt/pyenv/versions/2.7.13/bin/python \
  -D BUILD_EXAMPLES=OFF ..

make -j2
make install
cd ~/opt; ln -s opencv-2.4.13.2 opencv

echo "Setting more variables in .profile"
echo "export MAGICK_HOME=/home/$USER/opt/imagemagick" >> ~/.profile
echo "export LD_LIBRARY_PATH=/home/$USER/opt/opencv/lib:/home/$USER/opt/pyenv/versions/2.7.13/lib/python2.7/site-packages/PySide:\"\$MAGICK_HOME/lib/\":\$LD_LIBRARY_PATH" >> ~/.profile
echo "export PYTHONPATH=/home/$USER/opt/opencv/lib/python2.7/site-packages:\$PYTHONPATH" >> ~/.profile

echo "====================================="
echo "Installing matplotlib"
echo "====================================="

sudo apt install qt4-qmake qt4-dev-tools
pip install matplotlib

echo "Configuring matplotlib"
mkdir ~/.matplotlib;
echo "\"backend     : Qt4Agg\"" >> ~/.matplotlib/matplotlibrc
echo "\"backend.qt4 : PySide\"" >> ~/.matplotlib/matplotlibrc
echo "\"interactive : True\"" >> ~/.matplotlib/matplotlibrc

echo "====================================="
echo "Installing PySide"
echo "====================================="

cd ~/Downloads; wget https://pypi.python.org/packages/source/P/PySide/PySide-1.2.4.tar.gz
cd /home/$USER/opt; tar -xvzf ~/Downloads/PySide-1.2.4.tar.gz
ln -s PySide-1.2.4 pyside
cd pyside
python setup.py bdist_wheel
pip install dist/PySide-1.2.4-cp27-cp27mu-linux_x86_64.whl

echo "====================================="
echo "Installing nltk"
echo "====================================="
pip install nltk

echo "====================================="
echo "SCRIPT DONE"
echo "====================================="

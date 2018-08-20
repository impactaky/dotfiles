
MAYU_DIR=`readlink -f $0`
MAYU_DIR=`dirname $MAYU_DIR`

# install
git clone https://github.com/kenhys/mayu /tmp/mayu
cd /tmp/mayu
./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu/
sed -i -e "s/\(^CXXFLAGS.*\)$/\1 -std=c++98/" Makefile
make
sudo porg -lp mayu "make install"
if [ `localectl status | awk '/Layout/{print $NF}'` = "jp" ]; then
	ln -s $MAYU_DIR/.mayu_109 $HOME/.mayu
else
	ln -s $MAYU_DIR/.mayu_104 $HOME/.mayu
fi
ln -s $MAYU_DIR/.mayu $HOME/.mayu

# systemctl
sed -e "s|MAYU_DIR|$MAYU_DIR|" $MAYU_DIR/mayu.service.template > /tmp/mayu.service
sudo cp /tmp/mayu.service /etc/systemd/system/
sed -e "s|HOME_DIR|$HOME|" $MAYU_DIR/mayu.sh.template > $MAYU_DIR/mayu.sh
chmod +x $MAYU_DIR/mayu.sh
sudo systemctl daemon-reload
sudo systemctl enable mayu
sudo systemctl start mayu

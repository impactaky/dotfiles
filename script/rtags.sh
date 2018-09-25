git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
mkdir ./build
cd ./build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
make -j$(cat /proc/cpuinfo| grep processor | wc -l)
sudo porg -lp rtags make install

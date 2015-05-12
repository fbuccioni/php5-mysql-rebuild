#!/bin/sh

CFLAGS="-mtune=native -pipe"
CXXFLAGS="${CFLAGS}"
export LC_ALL="C"

extensions="mysql mysqli pdo_mysql"

install -d source
install -d source/deb

cd source/deb

apt-get source php5-mysql
cd php5-*
dir="$(pwd)"

run() {
    "$@" > /dev/null  2>&1
    [ "$?" != "0" ] && echo "error" && exit 1
}

for ext in $extensions; do
    echo "\n** $ext"

    cd $dir/ext/$ext

    echo ">> phpizing"
    run phpize

    #fix includes in debian/ubuntu /usr/include/php5 
    sed -i.bak -Ee 's#(\$prefix/include/php)/#\15/#g' configure

    echo ">> configuring"
    run ./configure

    echo ">> making"
    run make

    echo ">> installing"
    make install

    echo "done"
done


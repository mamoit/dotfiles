#!/bin/bash
set -e

if ! test -d "$LOCAL_INSTALL_FOLDER"; then
    echo "bad/unset LOCAL_INSTALL_FOLDER var"
    exit 1
fi

REPO=https://ftp.postgresql.org/pub/source/
VERSION=9.4.4
SOURCE_FOLDER=postgresql-$VERSION
PACKAGE=$SOURCE_FOLDER.tar.bz2

PG_INSTALL_FOLDER=$LOCAL_INSTALL_FOLDER/postgres

is_installed() {
    return `test -d $PG_INSTALL_FOLDER`
}

do_install() {
    # Check if it is already installed
    if is_installed; then
        echo "PostgreSQL is already installed."
        return 1
    fi

    # Download the source
    local TMP_FOLDER=`mktemp -d`
    mkdir -p $TMP_FOLDER
    cd $TMP_FOLDER
    wget https://ftp.postgresql.org/pub/source/v$VERSION/$PACKAGE
    tar -xf $PACKAGE

    # Configure postgresql
    cd $SOURCE_FOLDER
    ./configure --prefix=$PG_INSTALL_FOLDER

    # Compile
    make -j`nproc`

    # Install
    make install

    # Cleanup
    rm -rf $TMP_FOLDER

    # Add bin folder to path
    echo "export PATH=\"\$PATH:$PG_INSTALL_FOLDER/bin\";" >> ~/.path

    return 0
}

do_remove() {
    # Remove the folder
    rm -rf $PG_INSTALL_FOLDER
    # Remove the inclusion in the path
    sed -i '/postgres/d' ~/.path
}

case "$1" in
	install)
		do_install
        echo "To get the bins in the path start a new terminal or run:"
        echo ". ~/.path"
	;;
    status)
        if is_installed; then
            echo "PostgreSQL is installed"
        else
            echo "PostgreSQL is not installed"
        fi
    ;;
	remove)
		do_remove
	;;
	*)
		echo "usage: $0 {install|remove|list}"
		echo "- install: install postgres localy"
        echo "- status: checks if postgres is installed"
		echo "- remove: remove local install of postgres"
    	exit 2
	;;
esac

#!/bin/bash

name=SPSCQueue
type=cpp
gcc=
image=
artifacts=()
submodules=()
tests=()

function prebuild()
{
    rm -rf build
}

function build()
{
    mkdir -p $build_output
    cd build
    cmake3 .. && make -j || error_trap "cmake failure"
    cd ../
}

function postbuild()
{
    #cp -rf build/libspdlog.a $build_output

    tar -czvf "$build_output/SPSCQueue-1.1.tar.gz" -C include/ . || error_trap "failed to archive include/spdlog/ to $build_output."
}

function install()
{
    #sudo cp -rf $build_output/libspscqueue.a /usr/local/lib/
    sudo cp -rf include/rigtorp /usr/local/include/

    #sudo chmod 755 /usr/local/lib/libspscqueue.a
}

function uninstall()
{
    #sudo rm -rf /usr/local/lib/libspscqueue.a
    sudo rm -rf /usr/local/include/rigtorp
}

function test()
{
    return 0
}


# optionally add module-specific functions below

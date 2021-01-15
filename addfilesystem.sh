#!/bin/bash
# kiwonyoon0701@gmail.com
MYDATE=`date "+%Y-%m-%d-%H-%M-%S"`

function checkFileSystem()
{
        sudo file -s $1
}

function createXFSFileSystem()
{
        sudo mkfs -t xfs $1
}

function createMountPoint()
{
        sudo mkdir $1
}

function mountNewVolume()
{
        sudo mount $1
}

function modifyFSTAB()
{
        sudo cp /etc/fstab /etc/fstab.$MYDATE.org
        LINE=`sudo blkid | grep $1 | awk ' {print $2}'`
        NEWUUID=`echo $LINE|sed -e 's/"//g'`
        sudo echo $NEWUUID $2   'xfs    defaults,noatime  1   1' | sudo tee -a /etc/fstab
}

showResult()
{
        sudo df -h
        sudo cat /etc/fstab
}

lsblk
printf 'Type Volume Path ex>/dev/nvme1n1 : '
read -r VOLUMEPATH
printf 'Type Mount Point ex>/data : '
read -r MOUNTPOINT

checkFileSystem $VOLUMEPATH
createXFSFileSystem $VOLUMEPATH
createMountPoint $MOUNTPOINT
modifyFSTAB $VOLUMEPATH $MOUNTPOINT
mountNewVolume $MOUNTPOINT
showResult

#!/bin/bash

rm -rf Solar2DTux.AppDir/usr/lib/*
ARCH=x86_64 ./linux*.AppImage --appdir=Solar2DTux.AppDir --plugin gtk --output appimage

# Notes: --plugin gtk is experimental.

#!/bin/sh

rm -rf build/*
rm -rf docs/*

cp src/maiastatistics.maia build/
cp build/maiastatistics.maia bin/

chmod 755 bin/*

jsdoc -c ./jsdoc.json -d ./docs ./package.json ./src
jsdoc -c ./jsdoc.json -d ./docs ./maia/dfa/package.json ./maia/dfa
jsdoc -c ./jsdoc.json -d ./docs ./maia/statistics/package.json ./maia/statistics

#cp manual/* docs/
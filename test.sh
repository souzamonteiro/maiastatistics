#!/bin/sh

#
# Simple tests.
#

./bin/maiastatistics.maia --rhodcca test/cryptocoins/BTC-USD-Input.csv "test/cryptocoins/*Close.csv"
./bin/maiastatistics.maia --plot -o test/cryptocoins.png -i test/cryptocoins.json

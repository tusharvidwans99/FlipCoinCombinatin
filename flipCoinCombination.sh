#!/bin/bash -x
echo Welcome to the Flip Coin Combination.

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet."

flipcoin=$((RANDOM%2))

if [ $flipcoin == 1 ]
then
	echo Heads win
else
	echo Tails win
fi

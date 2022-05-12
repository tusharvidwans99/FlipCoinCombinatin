#!/bin/bash -x
echo Welcome to the Flip Coin Combination.

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet."

read -p "Enter the number of time wants to flip the coin: " number

declare -A singlet_operation

Heads=0
Tails=0

function singlet(){
num=$1
	for (( i=0;i<$num;i++ ))
	do
		flipcoin=$((RANDOM%2))

		if [ $flipcoin == 1 ]
		then
			singlet_operation[opr_$i]=H
			Heads=$(($Heads+1))
		else
			singlet_operation[opr_$i]=T
			Tails=$(($Tails+1))
		fi
	done
Heads_percentage=`echo $Heads/$num*100 | bc -l | awk '{printf "%.2f",$1}'`
Tails_percentage=`echo $Tails/$num*100 | bc -l | awk '{printf "%.2f",$1}'`
}

singlet $number

echo ${singlet_operation[@]}
echo Head Winning Percentage: $Heads_percentage
echo Tail Winning Percentage: $Tails_percentage

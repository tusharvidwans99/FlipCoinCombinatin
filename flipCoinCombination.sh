#!/bin/bash -x
echo Welcome to the Flip Coin Combination.

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet."

read -p "Enter the number of time wants to flip the coin: " number

declare -A singlet_operation
declare -A doublet_operation

Heads=0
Tails=0

HH=0
HT=0
TH=0
TT=0

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



function doublet(){
num=$1

	for ((i=0;i<$num;i++))
	do
		double_first=$((RANDOM%2))
		double_second=$((RANDOM%2))

		if [[ $double_first == 1 && $double_second == 1  ]]
		then
			doublet_operation[opr_$i]=HH
			HH=$(($HH+1))
		elif [[ $double_first == 1 && $double_second == 0  ]]
		then
			doublet_operation[opr_$i]=HT
			HT=$(($HT+1))
		elif [[ $double_first == 0 && $double_second == 1  ]]
		then
			doublet_operation[opr_$i]=TH
			TH=$(($TH+1))
		elif [[ $double_first == 0 && $double_second == 0  ]]
		then
			doublet_operation[opr_$i]=TT
			TT=$(($TT+1))
		fi
	done
HH_win_percentage=`echo $HH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
HT_win_percentage=`echo $HT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
TH_win_percentage=`echo $TH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
TT_win_percentage=`echo $TT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
}







singlet $number

echo ${singlet_operation[@]}
echo Head Winning Percentage: $Heads_percentage
echo Tail Winning Percentage: $Tails_percentage


doublet $number

echo ${doublet_operation[@]}
echo HH Winning Percentage: $HH_win_percentage
echo HT Winning Percentage: $HT_win_percentage
echo TH Winning Percentage: $TH_win_percentage
echo TT Winning Percentage: $TT_win_percentage

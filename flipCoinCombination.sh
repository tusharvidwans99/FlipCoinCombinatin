#!/bin/bash -x
echo Welcome to the Flip Coin Combination.

echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet."

read -p "Enter the number of time wants to flip the coin: " number

declare -A singlet_operation
declare -A doublet_operation
declare -A triplet_operation
HEAD=1
TAIL=0


Heads=0
Tails=0

HH=0
HT=0
TH=0
TT=0

HHH=0
HHT=0
HTH=0
THH=0
THT=0
TTH=0
HTT=0
TTT=0

function singlet(){
num=$1
	for (( i=0;i<$num;i++ ))
	do
		flipcoin=$((RANDOM%2))

		if [ $flipcoin == $HEAD ]
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
		elif [[ $double_first == $HEAD && $double_second == 0  ]]
		then
			doublet_operation[opr_$i]=HT
			HT=$(($HT+1))
		elif [[ $double_first == $TAIL && $double_second == $HEAD  ]]
		then
			doublet_operation[opr_$i]=TH
			TH=$(($TH+1))
		elif [[ $double_first == $TAIL && $double_second == $TAIL  ]]
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



function triplet(){

num=$1

	for ((i=0;i<$num;i++))
	do
		triple_first=$((RANDOM%2))
		triple_second=$((RANDOM%2))
		triple_third=$((RANDOM%2))

		if [[ $triple_first == $HEAD && $triple_second == $HEAD && $triple_third == $HEAD ]]
		then
			triplet_operation[opr_$i]=HHH
			HHH=$(($HHH+1))
		elif [[ $triple_first == $HEAD && $triple_second == $HEAD && $triple_third == $TAIL   ]]
		then
			triplet_operation[opr_$i]=HHT
			HHT=$(($HHT+1))
		elif [[ $triple_first == $HEAD && $triple_second == $TAIL && $triple_third == $HEAD  ]]
		then
			triplet_operation[opr_$i]=HTH
			HTH=$(($HTH+1))
		elif [[ $triple_first == $TAIL && $triple_second == $HEAD && $triple_third == $HEAD  ]]
		then
			triplet_operation[opr_$i]=THH
			THH=$(($THH+1))
		elif [[ $triple_first == $TAIL && $triple_second == $HEAD && $triple_third == $TAIL  ]]
		then
			triplet_operation[opr_$i]=THT
			THT=$(($THT+1))
		elif [[ $triple_first == $TAIL && $triple_second == $TAIL && $triple_third == $HEAD  ]]
		then
			triplet_operation[opr_$i]=TTH
			TTH=$(($TTH+1))
		elif [[ $triple_first == $HEAD && $triple_second == $TAIL && $triple_third == $TAIL  ]]
		then
			triplet_operation[opr_$i]=HTT
			HTT=$(($HTT+1))
		elif [[ $triple_first == $TAIL && $triple_second == $TAIL && $triple_third == $TAIL  ]]
		then
			triplet_operation[opr_$i]=TTT
			TTT=$(($TTT+1))
		fi
	done
HHH_win_percentage=`echo $HHH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
HHT_win_percentage=`echo $HHT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
HTH_win_percentage=`echo $HTH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
THH_win_percentage=`echo $THH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
THT_win_percentage=`echo $THT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
TTH_win_percentage=`echo $TTH/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
HTT_win_percentage=`echo $HTT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
TTT_win_percentage=`echo $TTT/$num*100 | bc -l | awk '{printf "%.2f", $1}'`
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


triplet $number

echo ${triplet_operation[@]}
echo HHH Winning Percentage: $HHH_win_percentage
echo HHT Winning Percentage: $HHT_win_percentage
echo HTH Winning Percentage: $HTH_win_percentage
echo THH Winning Percentage: $THH_win_percentage
echo THT Winning Percentage: $THT_win_percentage
echo TTH Winning Percentage: $TTH_win_percentage
echo HTT Winning Percentage: $HTT_win_percentage
echo TTT Winning Percentage: $TTT_win_percentage


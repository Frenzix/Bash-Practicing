#!/usr/bin/env bash

function inDomain {
	if [[ $3 -gt $1 ]] && [[ $3 - lt $2 ]]; then
		echo "In domain { $1 < $3 < $2 }"
	else
		echo "not in domain.."
	fi
}
function multiplier {
	
	local product=1
	
	for number in $@; do
		let product=$product*number
	done

	echo $product
}

function isEven {
	[[ $1%2 -eq 0 ]] && echo 1 || echo 0
}

function nevens {
	local count=0
	for number in $@; do
		if [[ $(isEven $number) -eq  1 ]]; then
			let count=$count+1
		fi
	done
	echo $count
}

function howodd {
	local odd_count=$(echo $#-$(nevens $@) | bc -l) 
	echo "$odd_count / $#" | bc -l 
}

function fib { 
	
	local x=0
	local y=1
	local z=0

	for _ in $(eval echo {1..$1}); do
		echo $x
		let z=$x+$y
		let x=$y
		let y=$z
	done
}

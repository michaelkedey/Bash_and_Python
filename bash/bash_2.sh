#!/bin/bash

#Author: michael kedey
#Date_created: 22/08/2023
#last_modified: 31/10/2023

name="Kofi"
udemy="Welcome to Udemy.com\n====================="
welcome="\nHi $name, thank you for your recent purchase from Udemy.com, 
please follow the onscreen guide to complete your payment\nplease note any wrong input will result in your card getting blocked\n"

validate_payment(){
	correct_cvc=113
	correct_post_code='T4E5J1'
	correct_card=4412

	local card=$1
	local post=$2
	local cv=$3

	if ! [[ $card =~ ^[0-9]{16}$ ]] || [[ ${card: -4} != $correct_card ]] ||  [[ $post != $correct_post_code ]] ||  [[ $cv != $correct_cvc ]]; then

		echo -e "\nsorry, we can't process your transaction due to incorrect card details\nyour card has been blocked, please conatact your local bank to have it restored"
		exit
	else
		echo -e "\ntransaction succesful, thank your for your purchase"
		exit
	fi
}

echo -e "$udemy"
sleep 1s
echo -e "$welcome"
sleep 1s

#accept customer payment details
read -p "please enter your 16 digit card number: " card_number
read -p "please enter the post code you signed up with: " post_code
read -p "please enter your cvc at the back of your card: " cvc
sleep 1s

validate_payment $card_number $post_code $cvc

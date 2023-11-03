#!/bin/bash

#Author: michael kedey
#Date_created: 22/08/2023
#last_modified: 31/10/2023

#check for single number  input
one_input_checker(){
local input=$1
let i=1
while [ $i -lt 3 ];
do
	#check if input matches regexp (numbers) and length of 1
	if ! [[ $input =~ ^[0-9]{1}$ ]]; then
                echo -e "invalid input detected, please try again\n"
                let i++
                echo -e "attempt $i of 3\n"
                read 
                if [ $i -eq 4 ]; then
                        echo "sorry, please take your card and start over"
                        exit
                fi
        else
                echo -e "excellent\n"
                let i=3
        fi
done

sleep 1s
}

#check for 4 digits number input
four_input_checker(){
local input=$1
let i=1
while [ $i -lt 3 ];
do
        if ! [[ $input =~ ^[0-9]{4}$ ]]; then
                echo -e "invalid input detected, please try again\n"
                let i++
                echo -e "attempt $i of 3\n"
                read
                if [ $i -eq 4 ]; then
                        echo "sorry, please take your card and start over"
                        exit
                fi
        else
                echo -e "excellent\n"
                let i=3
        fi
done

sleep 1s
}

#check for 3 digits input
cvc_input_checker(){
local input=$1
let i=1
while [ $i -lt 3 ];
do
        if ! [[ $input =~ ^[0-9]{3}$ ]]; then
                echo -e "invalid input detected, please try again\n"
                let i++
                echo -e "attempt $i of 3\n"
                read
                if [ $i -eq 4 ]; then
                        echo "sorry, please take your card and start over"
                        exit
                fi
        else
                echo -e "excellent\n"
                let i=3
        fi
done

sleep 1s
}

#compare and accept secure inputs
secure_compare (){
local input1=$1
local input2=$2
let i=1
while [ $i -lt 3 ]; do
	if ! [[ $input1 =~ ^[0-9]{4}$ ]] || ! [[ $input2 =~ ^[0-9]{4}$ ]] || ! [ "$input1" == "$input2" ]; then
		  echo -e "invalid inputs detected, please try again\n"
      		  let i++
      	          if [ $i -lt 3 ]; then
        		echo -e "attempt $i of 3\n"
        		echo "please enter new pin: "
        		read -s input1
        		echo "repeat pin: "
        		read -s input2
      		  else
       			 echo "Sorry, please take your card and start over."
        		 exit
      		  fi
    	  else
      		echo -e "Success\n"
      		let i=3
    	  fi
done

sleep 1s
}



#welcome message
welcome="Welcome to RBC\n===============\n"
echo -e "$welcome"
sleep 1s

#start setup wizard
echo -e "hello, please select your service in the options below\n1.activate card\n2.other serices\n"

#accept input
read selection

one_input_checker $selection

if [ $selection == 1 ]; then
	#take the card
        echo -e "please insert your card to begin\n"
        sleep 2s

        #accept last four card number
        read -p "please enter your last 4 card numbers: " last_four
        four_input_checker $last_four


        #accept cvc
        read -p "please enter your 3 digit cvc located at the back of your card: " cvc
	cvc_input_checker $cvc

        #create and repeat pin
        read -sp "please enter your new  pin(4 digits): " pin_one
	echo -e "\n"
        read -sp "please repeat your pin(4 digits): " pin_two
	echo -e "\n"
        secure_compare $pin_one $pin_two

        #compare the two inputs
        #compare $pin_one $pin_two

        echo "your card has been succesfully activated, goodbye"
        exit
else
	echo "sorry, our other services are down at the moment"
	exit
fi

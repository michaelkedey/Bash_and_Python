#!/bin/bash

#Author: michael kedey
#Date_created: 22/08/2023
#last_modified: 31/10/2023

transaction_approval(){
	credit_limit=2000
	transaction_amount=$1

	if [ "$transaction_amount" -le "$credit_limit" ]; then
		echo -e "\nsuccess\nyour transaction of $transaction_amount was succesful"
		exit
	else
		echo -e "\nsorry!\nyour transaction of $transaction_amount declined"
		exit
	fi
}

read -p "enter transaction amount: " transaction
transaction_approval $transaction

#!/bin/bash 
addUser (){
	input=$1     
	
	if_usr_exist=`getent passwd $input |cut -f 1 -d:`
	usr=$if_usr_exist
while [ "$input" = "$if_usr_exist" ]
	do
		echo "user name   $input   IS exist   to more details about $input choose 9) "
                rand=$(( ( RANDOM % 1000 ) ))
                username=$input${rand}
	
		if_usr_exist=`getent passwd $username |cut -f 1 -d:`
	done
  
	if [ "$input" != "$usr" ]     
	then
		useradd $input
		if_usr_exist=`getent passwd $input |cut -f 1 -d:`

		if [ "$input" = "$if_usr_exist" ]
		then
			echo "username $input is added successfully"
			echo "Don't forget choose 5) to put password"
		else
		 	echo "####### Failed! Try to Enter as a Sudo #######"
		fi
 
	else
		read -p "That user   $username   is available [Y/N]: "  ans
		if [ "$ans" = "y" -o "$ans" = "Y" ]
		then
            useradd $username
			if_usr_exist=`getent passwd $username |cut -f 1 -d:`
 
			if [ "$username" = "$if_usr_exist" ]
			then
				echo "username $username added successfully"
				echo "Don't forget choose 5) to put password"
			else
		 		echo "####### Failed! Try to Enter as a Sudo #######"
			fi

		elif [ "$ans" = "n" -o "$ans" = "N" ] 
		then
			echo "Enter another user to chek if is it valid"
        fi
	fi
}

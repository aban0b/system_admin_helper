#!/bin/bash


source ./addGroup.sh
source  ./addUser.sh
source ./addUser2Group.sh
source ./changePassword.sh
source ./deleteUser.sh
source ./deleteGroup.sh
source ./enableUser.sh
source ./disableUser.sh
source ./showDetails.sh



echo """
Welcome
"""

PS3="""
Please! Enter your choice : """

enter_user_name="""
Please enter user name  : """
enter_grp_name="""
Please enter group name  : """

select choice in "Add user" "Delete user" "Disable user" "Enable user" "Change password for user" "list users" "add comment to user"  "Create new group" "Delete group"  "Add user to group" "Show user details " "list groups" "Exit "
do
	case $choice in


"Add user")
		read -p "$enter_user_name" username 
				addUser $username ;;


"Delete user")
		read -p "$enter_user_name" username 
				deleteUser $username ;;


"Disable user")
		read -p "$enter_user_name" username 
				disableUser $username ;;


"Enable user")
		read -p "$enter_user_name" username 
				enableUser $username ;;


"Change password for user")
		read -p "$enter_user_name" username  

				 changePassword $username ;;


"list users")
        cut -d: -f1 /etc/passwd ;;

"add comment to user")
         read -p "please enter user name: " username
         read -p "please enter your comment: " cmnt
         usermod -c "$cmnt" $username
             echo "your comment is added successfully"
              ;;

"Create new group")
                read -p "$enter_grp_name" grpname
                                addGroup $grpname ;;


"Delete group")
		read -p "$enter_grp_name" grpname
				deleteGroup $grpname ;;	



"Add user to group")
	read -p "$enter_user_name" username
	read -p "$enter_grp_name" grpname
		addUser2Group $username $grpname ;;


"Show user details ")
	read -p "$enter_user_name" username

		showDetails $username  ;;


"list groups")
         cut -d: -f1 /etc/group ;;



"Exit ")
	exit ;;

	esac
done

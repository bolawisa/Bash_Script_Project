#!/bin/bash

# Function to add a user
add_user() {
    USERNAME=$(dialog --inputbox "Enter the username to add" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" ]]; then
        sudo useradd "$USERNAME"
        dialog --msgbox "User $USERNAME has been added successfully." 10 50
    else
        dialog --msgbox "No username entered." 10 50
    fi
}

# Function to delete a user
delete_user() {
    USERNAME=$(dialog --inputbox "Enter the username to delete" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" ]]; then
        sudo userdel "$USERNAME"
        dialog --msgbox "User $USERNAME has been deleted successfully." 10 50
    else
        dialog --msgbox "No username entered." 10 50
    fi
}

# Function to add a group
add_group() {
    GROUPNAME=$(dialog --inputbox "Enter the group name to add" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$GROUPNAME" ]]; then
        sudo groupadd "$GROUPNAME"
        dialog --msgbox "Group $GROUPNAME has been added successfully." 10 50
    else
        dialog --msgbox "No group name entered." 10 50
    fi
}

# Function to delete a group
delete_group() {
    GROUPNAME=$(dialog --inputbox "Enter the group name to delete" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$GROUPNAME" ]]; then
        sudo groupdel "$GROUPNAME"
        dialog --msgbox "Group $GROUPNAME has been deleted successfully." 10 50
    else
        dialog --msgbox "No group name entered." 10 50
    fi
}

# Function to show user information
show_user_info() {
    USERNAME=$(dialog --inputbox "Enter the username to view information" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" ]]; then
        INFO=$(getent passwd "$USERNAME")
        if [[ -n "$INFO" ]]; then
            dialog --msgbox "User Information:\n$INFO" 15 50
        else
            dialog --msgbox "User $USERNAME not found." 10 50
        fi
    else
        dialog --msgbox "No username entered." 10 50
    fi
}

# Function to show group information
show_group_info() {
    GROUPNAME=$(dialog --inputbox "Enter the group name to view information" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$GROUPNAME" ]]; then
        INFO=$(getent group "$GROUPNAME")
        if [[ -n "$INFO" ]]; then
            dialog --msgbox "Group Information:\n$INFO" 15 50
        else
            dialog --msgbox "Group $GROUPNAME not found." 10 50
        fi
    else
        dialog --msgbox "No group name entered." 10 50
    fi
}

# Function to change user password
change_password() {
    USERNAME=$(dialog --inputbox "Enter the username to change password" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" ]]; then
        sudo passwd "$USERNAME"
        dialog --msgbox "Password for $USERNAME has been changed successfully." 10 50
    else
        dialog --msgbox "No username entered." 10 50
    fi
}

# Function to add a user to a group
add_user_to_group() {
    USERNAME=$(dialog --inputbox "Enter the username to add to a group" 10 50 3>&1 1>&2 2>&3)
    GROUPNAME=$(dialog --inputbox "Enter the group name to add the user to" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" && -n "$GROUPNAME" ]]; then
        sudo usermod -aG "$GROUPNAME" "$USERNAME"
        dialog --msgbox "User $USERNAME has been added to group $GROUPNAME successfully." 10 50
    else
        dialog --msgbox "Missing username or group name." 10 50
    fi
}

# Function to remove a user from a group
remove_user_from_group() {
    USERNAME=$(dialog --inputbox "Enter the username to remove from a group" 10 50 3>&1 1>&2 2>&3)
    GROUPNAME=$(dialog --inputbox "Enter the group name to remove the user from" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$USERNAME" && -n "$GROUPNAME" ]]; then
        sudo gpasswd -d "$USERNAME" "$GROUPNAME"
        dialog --msgbox "User $USERNAME has been removed from group $GROUPNAME successfully." 10 50
    else
        dialog --msgbox "Missing username or group name." 10 50
    fi
}

# Function to change username
change_username() {
    OLD_USERNAME=$(dialog --inputbox "Enter the current username" 10 50 3>&1 1>&2 2>&3)
    NEW_USERNAME=$(dialog --inputbox "Enter the new username" 10 50 3>&1 1>&2 2>&3)
    if [[ -n "$OLD_USERNAME" && -n "$NEW_USERNAME" ]]; then
        sudo usermod -l "$NEW_USERNAME" "$OLD_USERNAME"
        dialog --msgbox "Username changed from $OLD_USERNAME to $NEW_USERNAME successfully." 10 50
    else
        dialog --msgbox "Missing old or new username." 10 50
    fi
}

# Function to show list of users
list_users() {
    USERS=$(cut -d: -f1 /etc/passwd)
    dialog --msgbox "List of users:\n$USERS" 15 50
}

# Function to show list of groups
list_groups() {
    GROUPS=$(cut -d: -f1 /etc/group)
    dialog --msgbox "List of groups:\n$GROUPS" 15 50
}

# Main menu
while true; do
    ACTION=$(dialog --title "User and Group Management" \
                    --menu "Select an option" 20 60 13 \
                    1 "Add User" \
                    2 "Delete User" \
                    3 "Add Group" \
                    4 "Delete Group" \
                    5 "Show User Info" \
                    6 "Show Group Info" \
                    7 "Change Password" \
                    8 "Add User to Group" \
                    9 "Remove User from Group" \
                    10 "Change Username" \
                    11 "List Users" \
                    12 "List Groups" \
                    13 "Exit" \
                    3>&1 1>&2 2>&3)

    case $ACTION in
        1) add_user ;;
        2) delete_user ;;
        3) add_group ;;
        4) delete_group ;;
        5) show_user_info ;;
        6) show_group_info ;;
        7) change_password ;;
        8) add_user_to_group ;;
        9) remove_user_from_group ;;
        10) change_username ;;
        11) list_users ;;
        12) list_groups ;;
        13) break ;;
        *) dialog --msgbox "Invalid option selected." 10 50 ;;
    esac
done

clear

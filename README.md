# User Group Manager - Bash Script

This is a powerful and interactive **Bash script** for managing **users** and **groups** on Linux systems. It provides an easy-to-use interface for system administrators and users to perform common system administration tasks. The script uses `dialog` to present a text-based user interface (TUI), making it accessible and simple to use.

## Features

This script allows you to perform the following tasks:

- **Add User**: Add a new user to the system.
- **Delete User**: Remove an existing user from the system.
- **Add Group**: Create a new group on the system.
- **Delete Group**: Remove an existing group from the system.
- **Show User Info**: View detailed information about a user.
- **Show Group Info**: View detailed information about a group.
- **Change Password**: Update a user's password.
- **Add User to Group**: Add a user to an existing group.
- **Remove User from Group**: Remove a user from a group.
- **Change Username**: Change a user's username.
- **List Users**: Display a list of all system users.
- **List Groups**: Display a list of all system groups.
- **Exit**: Exit the script and return to the shell.

## Installation

To get started with this script, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/user-group-manager.git
    cd user-group-manager
    ```

2. **Install the required dependencies**:
    Make sure that `dialog` is installed on your system:
    ```bash
    sudo yum install dialog
    ```

3. **Make the script executable**:
    ```bash
    chmod +x user_group_manager.sh
    ```

4. **Run the script**:
    ```bash
    ./user_group_manager.sh
    ```

## Usage

Once the script is running, you will be presented with an interactive menu to choose the operation you want to perform. The options are:

1. **Add User**: Add a new user to the system by entering the username.
2. **Delete User**: Remove a user by entering the username to be deleted.
3. **Add Group**: Create a new group by entering the group name.
4. **Delete Group**: Remove an existing group by entering the group name.
5. **Show User Info**: Enter a username to see detailed information about that user.
6. **Show Group Info**: Enter a group name to see detailed information about that group.
7. **Change Password**: Change the password for an existing user.
8. **Add User to Group**: Add an existing user to a group.
9. **Remove User from Group**: Remove an existing user from a group.
10. **Change Username**: Change the username of an existing user.
11. **List Users**: Display a list of all users on the system.
12. **List Groups**: Display a list of all groups on the system.
13. **Exit**: Exit the script.

### Example Usage

1. **Add a User**: 
    - Choose the "Add User" option from the menu.
    - Enter the desired username to create the user.
    
2. **Change a User's Password**:
    - Choose the "Change Password" option.
    - Enter the username and follow the prompts to change the password.

## Contributing

We welcome contributions to this project! If you'd like to improve the script or add new features, please fork the repository and submit a pull request.

Here’s how you can contribute:
1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them with a descriptive message.
4. Push your changes to your fork.
5. Open a pull request to the `main` branch.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Thanks to the community for their contributions and feedback.
- Special thanks to [dialog](https://linux.die.net/man/1/dialog) for providing a simple and effective way to create interactive command-line interfaces.

## Contact

For any questions or suggestions, feel free to open an issue on GitHub, or contact me directly via email.

---

*Happy scripting!*

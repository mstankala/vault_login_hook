# Vault Login Hook for Zsh
This Zsh configuration file (`.zshrc) includes a hook function `vault_login_hook 
that automates the process of logging into HashiCorp Vault 
when you navigate to a directory containing a `.vault` file. 
The function ensures that the `vault` command is installed and manages your Vault token, ensuring it is refreshed if older than 12 hours.

## Features
- **Automatic Vault Login**: Checks for the presence of a `.vault` file in the current directory and logs into Vault using the address specified in this file.
- **Installation of Vault CLI**: Ensures the `vault command-line tool is installed via Homebrew if it is not already present.
- **Token Management**: Checks the age of the existing Vault token and refreshes it if it is older than 12 hours.
- **Automatic Execution**: Hooks into the Zsh directory change (`chpwd) event to automatically perform the login check when you navigate to a new directory.

## Installation
- Copy and paste the code in the file zshrc-hook.sh into your .zshrc file
- After updating your .zshrc file, reload it to apply the changes:
> source ~/.zshrc

## Usage

- Create a `.vault file in the directories where you want the automatic Vault login to occur. This file should contain the address of the Vault server.
> echo "http://your-vault-server-address" > .vault

- Change to the directory containing the `.vault` file. The `vault_login_hook` will automatically execute, ensuring you are logged into Vault and your token is valid.


# Function to check for .vault file and perform login
vault_login_hook() {
  if [ -f ".vault" ]; then
	# Check if vault command is installed
	if ! command -v vault &> /dev/null; then
	  echo "vault command not found. Installing via Homebrew..."
	  brew tap hashicorp/tap
	  brew install hashicorp/tap/vault
	fi

	# Path to the .vault-token file
	VAULT_TOKEN_FILE="$HOME/.vault-token"

	# Check if .vault-token file exists and is older than 12 hours
	if [ -f "$VAULT_TOKEN_FILE" ]; then
	  TOKEN_AGE=$(($(date +%s) - $(stat -f %B "$VAULT_TOKEN_FILE")))
	  MAX_AGE=$((12 * 3600))

	  if [ "$TOKEN_AGE" -le "$MAX_AGE" ]; then
	    return
	  fi
	fi

	ADDRESS=$(cat .vault)
    vault login -address "$ADDRESS" -method oidc
  fi
}
# add vault-loginto chpwd hook
add-zsh-hook chpwd vault_login_hook
vault_login_hook
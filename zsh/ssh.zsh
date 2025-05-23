# Passwordless and safe SSH access for work

# --- Helper Functions ---

PASS_PREFIX="MSKCC"

# Retrieve password from 'pass' CLI
get_password() {
  local user="$1"
  local pass_name="${PASS_PREFIX}/${user}"

  pass "$pass_name" 2> /dev/null || {
    echo "ERROR: Failed to retrieve password for user '$user' (pass name: '$pass_name')." >&2
    return 1
  }
}

# Perform SSH without password prompt, or execute a command remotely
ssh_with_pass() {
  local user="$1"
  local host="$2"
  local command="$3"  # Optional command to execute remotely

  local password=$(get_password "$user") || return 1
  export SSHPASS="$password"
  if [[ -z "$command" ]]; then
    # Interactive session
    sshpass -e ssh "${user}@${host}"
  else
    # Execute a command
    sshpass -e ssh "${user}@${host}" "$command"
  fi
  unset SSHPASS
}

# --- Aliases for quick access ---

# ssh
ssd() { ssh_with_pass smile smile-dev.mskcc.org; } # [s]sh [s]mile [d]ev
ssp() { ssh_with_pass smile smile.mskcc.org; }
sqd() { ssh_with_pass "$USER" smile-dev.mskcc.org; }
sqp() { ssh_with_pass "$USER" smile.mskcc.org; }

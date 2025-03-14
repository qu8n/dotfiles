PASS_PREFIX="MSKCC"
MOUNT_BASE_DIR="$HOME/mnt"

# --- Helper Functions ---

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
ssh_with_pass_generic() {
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

# Mount a remote directory using sshfs without password prompt
sshfs_with_pass_generic() {
  local user="$1"
  local host="$2"
  local remote_dir="/"  # Default to root, but make it configurable
  local mount_point="$MOUNT_BASE_DIR/$user@$host"

  mkdir -p "$mount_point" || {
    echo "ERROR: Failed to create mount point: '$mount_point'" >&2
    return 1
  }

  local password=$(get_password "$user") || return 1

  export SSHPASS="$password"
  sshfs -o password_stdin "${user}@${host}:${remote_dir}" "$mount_point" <<< "$SSHPASS"
  unset SSHPASS

  if [[ $? -eq 0 ]]; then  # Check if sshfs was successful
    cd "$mount_point" || {
      echo "WARNING:  sshfs mounted, but could not cd to '$mount_point'" >&2
    }
  else
     echo "ERROR: sshfs mount failed for ${user}@${host}:${remote_dir} to ${mount_point}." >&2
     return 1
  fi
}

# List all mounted directories
# [l]ist [m]ounts
lm() {
  # List all mounted directories
  mount | grep "$MOUNT_BASE_DIR"
}

# Unmount all SSHFS mounts
# [u]n[m]ount [a]ll
uma() {
  if [[ ! -d "$MOUNT_BASE_DIR" ]]; then
    echo "Mount base directory '$MOUNT_BASE_DIR' does not exist." >&2
    return 0
  fi
  cd "$MOUNT_BASE_DIR"
  for mount_point in "$MOUNT_BASE_DIR"/*/; do  # The trailing / ensures it's a directory
    if [[ -d "$mount_point" ]]; then
      echo "Unmounting: $mount_point"
      umount -f "$mount_point"
    fi
  done
}

# --- Aliases for quick access ---

# ssh
ssd() { ssh_with_pass_generic smile smile-dev.mskcc.org; } # [s]sh [s]mile [d]ev
ssp() { ssh_with_pass_generic smile smile.mskcc.org; }
sqd() { ssh_with_pass_generic "$USER" smile-dev.mskcc.org; }
sqp() { ssh_with_pass_generic "$USER" smile.mskcc.org; }

# sshfs
sfsd() { sshfs_with_pass_generic smile smile-dev.mskcc.org; } # [s]sh[f]s [s]mile [d]ev
sfsp() { sshfs_with_pass_generic smile smile.mskcc.org; }
sfqd() { sshfs_with_pass_generic "$USER" smile-dev.mskcc.org; }
sfqp() { sshfs_with_pass_generic "$USER" smile.mskcc.org; }

# Execute a command remotely
# e.g. sdr 'ls -l /data'
sdr() { ssh_with_pass_generic smile smile-dev.mskcc.org "$*"; } # [s]mile [d]ev [r]un
spr() { ssh_with_pass_generic smile smile.mskcc.org "$*"; }

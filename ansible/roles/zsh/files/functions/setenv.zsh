# Usage: setenv <path-to-env-file>
setenv() {
  local env_file="$1"

  if [ ! -f "$env_file" ]; then
    echo "Error: File not found: $env_file" >&2
    return 1
  fi

  if [ -n "${SETENV_VARS}" ]; then
    unsetenv
  fi

  # Create an empty array to store the variable names
  declare -g SETENV_VARS=()

  # Read the file line by line and export the variables
  while IFS= read -r line || [[ -n "$line" ]]; do
    # Skip comments and empty lines
    if [[ "$line" =~ ^# || -z "$line" ]]; then
      continue
    fi

    # Get the variable name
    local name="${line%%=*}"

    # Export the variable
    export "$line"

    # Add the name to array of variables
    SETENV_VARS+=("$name")

  done < "$env_file"
  echo "Environment variables loaded from $env_file"
}

unsetenv() {
  if [ -z "${SETENV_VARS}" ]; then
    echo "No environment variables to unset."
    return 0
  fi
  
  # Unset each variable from the list
  for var in "${SETENV_VARS[@]}"; do
    unset "$var"
  done

  # Clear the list
  unset SETENV_VARS
  echo "Environment variables unset."
}

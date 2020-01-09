# Add alias for ls command
alias l='ls -alh'

# Display today's date with nice formatting
display_current_date() {
	echo -n "Today's date is: "
	date +"%A, %B %-d, %Y"
}
alias today='display_current_date'

# Display the current time
display_current_time() {
  date +"%T"
}
alias now='display_current_time'

# List all users in system
list_users() {
  awk -F':' '{ print $1 }' /etc/passwd
}
alias list-users=list_users

# List all super users
list_super_users() {
  grep '^sudo:.*$' /etc/group | cut -d: -f4
}
alias super-users='list_super_users'

# Check if user has sudo privilege
has_sudo() {
  sudo -l -U "${1}"
}
alias is-sudo="has_sudo "${1}""

# Display user hash
display_hash() {
  if [[ -n "${USER_HASH}" ]]; then
    echo "${USER_HASH}"
  else
    echo 'Not Authorized'
  fi
}
alias my-pw='display_hash'

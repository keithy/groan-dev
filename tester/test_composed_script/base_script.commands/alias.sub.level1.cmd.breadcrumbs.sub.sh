# A sub-command invocation
#
# by Keith Hodges 2018
#
# Sub-commands like 'help.sub.helper.cmd.sh' are invoked based upon their prefix <cmd>.sub
# 
# This script is then able to interpret for itself the rest of its own name.
# In this case the sub-command in the parent command's list,
# is implemented by the <helper>.cmd command contained in the parent folder
#  
# So mapped sub-commands may have identical implementation, taking parameters from their own name

$DEBUG && echo "${dim}${BASH_SOURCE}${reset}"

commandName="${scriptName%.cmd.*}"  # keep everything up to .cmd.
commandName="${commandName#*.sub.}" # keep everything after .sub.
commandDir="${scriptDir%/*}/$commandName"
dispatchName="${scriptName#*.cmd.}"  # keep everything after .cmd.

$DEBUG && echo "scriptName: ${bold}$scriptName${reset}"
$DEBUG && echo "commandDir: $commandDir"

readLocations

shiftArgsIntoNext
subcommand="$next"
[ -z "$subcommand" ] && subcommand="$defaultSubcommand" 

$DEBUG && echo "$scriptSubcommand($commandName) sub-command: '$subcommand' args(${#args[@]}): ${args[@]:+${args[@]}}"

# if no argument get the default for this command
# given the argument look for commands that match
for scriptDir in "${locations[@]}"
do

    if [ -f "$scriptDir/$dispatchName" ]; then
        source "$scriptDir/$dispatchName"
    fi
done

# So no commands match the argument...
 
$LOUD && echo "Not Found: ${bold}${breadcrumbs}${reset} sub-command '${bold}${subcommand}${reset}'."
 
exit 1

# "This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
# Any additional contribution submitted for incorporation into or for distribution with this file shall be presumed
# subject to the same license."


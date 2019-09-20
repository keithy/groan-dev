# grow.help.cmd.sh
#
# by Keith Hodges 2010
#
$DEBUG && echo "${dim}${BASH_SOURCE}${reset}"

# General Help On Commands

# may have been invoked with a partial name
# so set the full command name
command="default"
description="report level"
#since help doesn't exec anything many common options don't apply
commonOptions="--theme=light    # alternate theme"
usage="$breadcrumbs <command|topic>
$breadcrumbs breadcrumbs
$breadcrumbs level
$breadcrumbs --help    # this text"

$SHOWHELP && executeHelp
$METADATAONLY && return

$DEBUG && echo "DispatchList: '$dispatchList'"
$DEBUG && echo "Command: '$command'"
  
rootCommandDir=$(dirname "$rootCommandFile")
level=${commandDir:${#rootCommandDir}} # obtain the relative path to the root command
level=${level//[^\/]/}                 # count the number of / in the path
level=${#level}                  

echo "Level: ${level}"   

exit 0

#"This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
#Any additional contribution submitted for incorporation into or for distribution with this file shall be presumed subject to the same license."
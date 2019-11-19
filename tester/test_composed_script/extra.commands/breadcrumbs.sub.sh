# grow.help.cmd.sh
#
# by Keith Hodges 2010
#
$DEBUG && echo "${dim}${BASH_SOURCE}${reset}"

# General Help On Commands

# may have been invoked with a partial name
# so set the full command name
command="breadcrumbs"
description="show breadcrumbs"
usage="$breadcrumbs           #show breadcrumbs
$breadcrumbs  --help   #this text"

$SHOWHELP && g_displayHelp
$METADATAONLY && return

$DEBUG && echo "Command: '$command'"

breadcrumbs="$breadcrumbs"

echo "$breadcrumbs"

exit 0

#"This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
#Any additional contribution submitted for incorporation into or for distribution with this file shall be presumed subject to the same license."
# groan help commands.cmd.sh
#
# by Keith Hodges 2018

$DEBUG && echo "${dim}${BASH_SOURCE}${reset}"

command="commands"
description="list available commands"
#since help doesn't exec anything many common options don't apply
commonOptions="--theme=light    # alternate theme"
usage="$breadcrumbs    # list commands"

$SHOWHELP && executeHelp
$METADATAONLY && return
 
# The function of find_commands is to populate the two arrays
# commandFileList= each element is a sub-command file (e.g. helper)
# breadcrumbsList= each element is a list of subcommands that reaches the above command

# Recursively scan the subcommands for those that call the dispatcher of a contained command
function find_commands()
{
# $DDEBUG && set -x

  local commandFile="$1"
  local crumbs="$2"

  commandFileList+=("$commandFile")
  crumbsList+=("$crumbs")

  local scriptDir
  local scriptPath

  readLocations "$commandFile"

  for scriptDir in "${locations[@]}"
  do
    for scriptPath in "$scriptDir"/*.sub.*.cmd.*
    do
      parseScriptPath "$scriptPath"

      if [ -n "scriptSubcommand" ]; then
        if ! [[ "$destSubcommandName" == *.sub.* ]]; then #this subcommand invokes a dispatcher
          crumbs="$2 $scriptSubcommand"
          find_commands "$destPath" "$crumbs"
        fi
      fi
    done
  done


 if $DDEBUG; then
  :
  set +x
 fi
}
 
function list_subcommands()
{
  commandFile="$1"
  crumbs="$2"
 
  readLocations "$commandFile"

  for scriptDir in ${locations[@]} ; do

    for scriptPath in $scriptDir/*.sub.*
    do
      parseScriptPath "$scriptPath"

      $DEBUG && echo "Parsed: …${scriptDir##*/}${dim}/${reset}$scriptName (${scriptSubcommand:-no subcommand})" 

      if [ -n "$scriptSubcommand" ]; then
        [[ "$scriptSubcommand" == _* ]] || crumbs="$2 $scriptSubcommand"

        METADATAONLY=true
        executeScriptPath "$scriptPath"  

        printf "%-45s" "$crumbs"
        echo "$description"

      fi
    done
  done
}

commandFileList=()
crumbsList=()
 
find_commands "$rootCommandFile" ${rootCommandFile##*/}

if $DEBUG; then # print out results of recursive search
  echo
  for i in "${!commandFileList[@]}"; do    
       printf "(%d) %-45s" $i ${crumbsList[i]}
       echo "${commandFileList[i]}"
  done
  echo
fi

for i in "${!commandFileList[@]}"
do
  echo "${bold}${commandFileList[i]##*/} commands:${reset}"

  list_subcommands "${commandFileList[i]}" "${crumbsList[i]}"
  
  echo
done

exit 0

#"This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
#Any additional contribution submitted for incorporation into or for distribution with this file shall be presumed subject to the same license."
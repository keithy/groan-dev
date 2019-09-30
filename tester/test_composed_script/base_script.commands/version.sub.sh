# groan version.sub.sh
#
# by Keithy 2019
#

$DEBUG && echo "${dim}${BASH_SOURCE}${reset}"

command="version"
description="returns version tagged in git and the short hash"
usage="usage:
$breadcrumbs version"

$SHOWHELP && executeHelp
$METADATAONLY && return

commandFileList=()
crumbsList=()
find_commands "$rootCommandFile" "${rootCommandFile##*/}"

# get the cached version, the git version, use cache if git not working, if changed write cache
function get_version()
{
  local dir="$1"
  local cached=$(cat "$dir/.version" 2> /dev/null ) || true
  local version=$(cd "$dir"; git describe --long --tags --dirty --always 2> /dev/null ) || true
  version="${version:-$cached}"
  [[ "$version" == "cached" ]] || echo "$version" > "$dir/.version" || true
  
  [ -n "$version" ] && echo "${bold}${dim}(${dir##*/})${reset} ${bold}${2:-}${reset}: ${version}"
}

# get the version of this sub-command's command (i.e. groan)

get_version $(dirname "${BASH_SOURCE%/*}")

for i in "${!commandFileList[@]}"
do
  readLocations "${commandFileList[i]}"

  get_version "${commandFileList[i]%/*}" "${crumbsList[i]}"
  
done
 
exit 0

#"This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
#Any additional contribution submitted for incorporation into or for distribution with this file shall be presumed subject to the same license."
#locations to search for configuration *.conf files

configOptions=("--local" "--user" "--global")

configFileLocations=(
	"$workingDir/$commandName.conf.sh"  # --local
	"$HOME/.$commandName.conf.sh"       # --user
	"$commandDir/$commandName.conf.sh"  # --global
)

#locations to search for commands
locations=(
	"$commandDir/$commandName.commands" # basic_script commands for testing 
	"$commandDir/extra.commands" # extra commands for testing 
)

defaultDispatch="_dispatch.sh"
defaultSubcommand="test"
 
themePath=( "$commandDir/../../groan/groan/groan.themes.sh" "$commandDir/$commandName.themes.sh" "$commandDir/$commandName.theme-$THEME.sh" )

markdownViewerUtility="mdv -t 715.1331"

# "This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
# Any additional contribution submitted for incorporation into or for distribution with this 
# file shall be presumed subject to the same license."
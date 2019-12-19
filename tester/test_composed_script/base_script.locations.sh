# Testing composition/merger to two command sets at the same level

#g_locations to search for commands
g_locations=(
	"$c_dir/$c_name.commands" # basic_script commands for testing 
	"$c_dir/extra.commands" # extra commands for testing 
)

g_default_subcommand="test"
 
# "This Code is distributed subject to the MIT License, as in http://www.opensource.org/licenses/mit-license.php . 
# Any additional contribution submitted for incorporation into or for distribution with this 
# file shall be presumed subject to the same license."
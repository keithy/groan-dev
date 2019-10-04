
# Credentials for accessing hosts
# the user must have the appropriate ssh access

sensible_host_names=('test' 'atomic' 'rocky')
 
declare -Ag sensible_deploy sensible_tags sensible_install

sensible_install["_default_"]="/usr/local/bin"

sensible_deploy[test]='localhost:/tmp/sensible'
sensible_tags[test]='test'
sensible_install[test]='/tmp'

sensible_deploy[atomic]='keith@atomic.flat:/home/keith/base'
sensible_install[atomic]='/home/keith/bin'
sensible_tags[atomic]='server'

sensible_deploy[rocky]='localhost:/tmp/sensible'
sensible_tags[rocky]='arm'

rsync="rsync -a"
ssh=""
 
set -x
cd $1
DEPURL="${1}.meteor.com"
echo "deploying $DEPURL"
meteor deploy $DEPURL

set -x

cd sidemenu
DEPURL="chatu.meteor.com"
echo "deploying $DEPURL"
meteor deploy $DEPURL

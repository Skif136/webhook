# Tag
dir=all_webhooks_detailed.json
#sed s/'\s'//g -i $dir

grep -rl '{' $dir | xargs sed -i 's/{/ /g' $dir
grep -rl '}' $dir | xargs sed -i 's/}/ /g' $dir
grep -rl '"AppName":' $dir | xargs sed -i 's/"AppName":/AppName: /g' $dir
grep -rl '"Type":' $dir | xargs sed -i 's/"Type":/Type: /g' $dir
grep -rl '"AlertID":' $dir | xargs sed -i 's/"AlertID":/AlertID: /g' $dir
grep -rl '"Summary":' $dir | xargs sed -i 's/"Summary":/Summary: /g' $dir
grep -rl '"Details":' $dir | xargs sed -i 's/"Details":/Details: /g' $dir
SENDME=$(<all_webhooks_detailed.json)
curl -X POST https://api.telegram.org/bot5063898377:AAGwKg4WDVDoEg76BiLAMBJVA0i-HrePfkw/sendMessage -d chat_id=210293096 -d \
text="$SENDME"

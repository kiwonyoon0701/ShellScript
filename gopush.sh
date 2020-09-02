# Version 20200902-1
# This script automatically replacing ACCESS_KEY and SECRET_KEY to null before pusing into git repo
# You can protect your AWS credentials to use this script...Maybe :)
# Tested in zsh 5.3 (x86_64-apple-darwin18.0) in MAC
git add .
MYDATE=`date +"%Y-%m-%d-%H-%M-%S"`
git status --porcelain |sed s/^...// | xargs sed -i '' 's/MY_ACCESS_KEY//g; s/MY_SECRET_ACCESS_KEY//g'
git add .
git commit -m $MYDATE
git push



# Version 20200902-2
# IF your access and security has character slash '/', then you have to use ? for sed instead of / 
# This script automatically replacing ACCESS_KEY and SECRET_KEY to null before pusing into git repo
# You can protect your AWS credentials to use this script...Maybe :)
# Tested in zsh 5.3 (x86_64-apple-darwin18.0) in MAC
git add .
MYDATE=`date +"%Y-%m-%d-%H-%M-%S"`
git status --porcelain |sed s/^...// | xargs sed -i '' 's?MY_ACCESS_KEY??g; s/MY_SECRET_ACCESS_KEY??g'
git add .
git commit -m $MYDATE
git push

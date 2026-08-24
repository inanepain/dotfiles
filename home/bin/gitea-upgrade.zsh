#!/usr/bin/env zsh
# ====================================================================
# gitea upgrade
# version 2
#
# changelog
# v2 - 2025 Oct 27
# reduced size of backup file
# - cleanup logs
# - cleanup old binary files
# - dropped -001 from sql backup file
#
# scp ~/bin/gitea-upgrade.zsh philip@granny:/Users/philip/bin/gitea-upgrade.zsh
# scp philip@granny:/Users/philip/bin/gitea-upgrade.zsh ~/bin/gitea-upgrade.zsh
echo "Gitea Upgrade"
# ====================================================================

# autoload ask
autoload ~/bin/functions/ask

# ====================================================================

giteaOld=1.27.1
giteaNew=1.27.2
# dbHost=db.cathedral.co.za
dbHost=localhost
# dbPwd=A3xs7gjfL3UCHi8gEY2R
dbPwd=blackbetty

giteaDate=`/bin/date '+%Y-%m-%d'`

cfgFile=`hostname`
cfgFile="gitea-${cfgFile:l}.conf"

laughPlistFile=/Users/philip/Library/LaunchAgents/local.granny.gitea.web.plist

if [[ -f $cfgFile ]]; then
    echo "Loading config file: $cfgFile"
    source $cfgFile
fi

giteaBackup=$giteaOld-$giteaDate

echo "From version: $giteaOld"
echo "To version: $giteaNew"
echo "Date: $giteaDate"
echo "Database => host: $dbHost"
echo ""

if ! ask "Are these values correct?" Y; then
    echo "Please edit this script and update the variables to the correct values.";
    echo "Or use a config file in the current directory: $cfgFile"
    exit 1;
fi

# ====================================================================
# Gitea service stop
echo "Step: gitea service"
# ====================================================================
echo "\tstopping..."
launchctl unload $laughPlistFile

# srv root
cd ~/srv
# ====================================================================
# Cleanup binary files & logs
echo "Step: cleanup"
# ====================================================================
echo "\tcleanup => logs"
# cleanup logs
rm -f gitea/log/*.log
rm -f gitea/*.log

# cleanup binary files
echo "\tcleanup => binary files"
rm gitea/bin/gitea-*
# rm gitea/bin/gitea*

# ====================================================================
# Backup database & files
echo "Step: backup"
# ====================================================================
echo "\tbackup => database"
# create backup directory
mkdir -p ~/bak/gitea/gitea-$giteaBackup/

# copy paste password: 
echo "\tCopy password to paste at prompt: $dbPwd"
# backup database
mysqldump --host=$dbHost --port=3306 --default-character-set=utf8 --user=root --protocol=tcp -p "gitea" >~/bak/gitea/gitea-$giteaBackup/gitea-$giteaBackup.sql

echo "\tbackup => files"
# backup data
tar -cf - gitea/ | xz -9e --threads=8 -c - >~/bak/gitea/gitea-$giteaBackup/gitea-$giteaBackup.tar.xz

# ====================================================================
# Create a single archive of all backup data
echo "Step: archive"
# ====================================================================
echo "\tarchiving => ~/bak/gitea/gitea-$giteaBackup.tar.xz"
cd ~/bak/gitea
tar -cf - gitea-$giteaBackup/ | xz -9e --threads=8 -c - >gitea-$giteaBackup.tar.xz

# ====================================================================
# Fetch and implement new version
echo "Step: executable"
# ====================================================================
# gitea bin directory
cd ~/srv/gitea/bin

# download update
echo "\tnew => downloading..."
curl -o gitea-$giteaNew-darwin-10.12-arm64.xz https://dl.gitea.com/gitea/$giteaNew/gitea-$giteaNew-darwin-10.12-arm64.xz

# extract
echo "\tnew => extracting..."
xz -d gitea-$giteaNew-darwin-10.12-arm64.xz

# make executable
echo "\tnew => set executable..."
chmod a+x gitea-$giteaNew-darwin-10.12-arm64

# backup current
if [[ ! -f gitea-$giteaOld ]]; then
    echo "\tcurrent => backup..."
    mv gitea gitea-$giteaOld
else
    rm gitea
fi

# install new version
echo "\tnew => installing..."
mv gitea-$giteaNew-darwin-10.12-arm64 gitea-$giteaNew
ln gitea-$giteaNew gitea

# ====================================================================
# Gitea service start
echo "Step: gitea service"
# ====================================================================
# restart the server
echo "\tstarting..."
launchctl load $laughPlistFile

echo "That's it, all done. Enjoy gitea $giteaNew"

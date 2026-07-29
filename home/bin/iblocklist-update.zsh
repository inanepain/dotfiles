#!/usr/bin/env zsh

# original: https://github.com/Naunter/BT_BlockLists
# source: https://github.com/Naunter/BT_BlockLists/blob/master/update.sh

# list entry history
# 2026-05-14: 447087
# 2026-05-15: 460785 (+13698)

source ~/bin/functions/colours

# change to directory of script
SCRIPT_DIR=${0:A:h}
cd "$SCRIPT_DIR"

msg "${Cyan}Blocklist updator (Transmission))"

msg "\t${Green}Fetching IPs from ${Blue}~/etc/iblocklist-urls.txt"
wget2 --progress=bar --no-use-server-timestamps -i ~/etc/iblocklist-urls.txt -O - | sed "/^#.*/d" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort --unique > ~/tmp/list_1.txt

msg "\t${Green}Preparing list structure"
while read line; do 
    echo "blocklist:$line-$line"; 
done < ~/tmp/list_1.txt > ~/tmp/combined_1.txt
rm -f ~/tmp/list_1.txt

msg "\t${Green}Fetching list from ${Blue}iblocklist.com"
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://www.iblocklist.com/lists.php \
        | sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
        | sed "s/\&amp;/\&/g" \
        | sed "s/http/\"http/g" \
        | sed "s/gz/gz\"/g" \
        | xargs curl -s -L \
        | gunzip \
        | egrep -v '^#' \
        | sed "/^$/d" >> ~/tmp/combined_1.txt

msg "\t${Green}Fetching list from ${Blue}codebucket.de"        
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://mirror.codebucket.de/transmission/blocklist.p2p >> ~/tmp/combined_1.txt

msg "\t${Green}Fetching list from ${Blue}githubusercontent.com/waelisa/Best-blocklist"
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://raw.githubusercontent.com/waelisa/Best-blocklist/main/wael.list.txt | sed "/^#.*/d" | grep -Ev "^[0-9][0-9][0-9]\.[0-9][0-9][0-9].*" >> ~/tmp/combined_1.txt

msg "\t${Green}Sorting & filtering unique entries"
sort --unique ~/tmp/combined_1.txt > ~/tmp/combined_2.txt
rm -f ~/tmp/combined_1.txt

msg "\t${Green}Compressing list"
gzip -c ~/tmp/combined_2.txt > ~/tmp/bt_blocklists.gz
rm -f ~/tmp/combined_2.txt

msg "\t${Green}Storing list by date"
mv -f ~/tmp/bt_blocklists.gz ~/etc/iblocklist/
ln -f ~/etc/iblocklist/bt_blocklists.gz ~/bak/iblocklist/bt_blocklists-$(date +%F).gz

msg ""
msg "${Green}Blocklist: ${Blue}file://${HOME}/etc/iblocklist/bt_blocklists.gz"
msg "${Cyan}Done"

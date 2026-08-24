#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# sqlite3
#####################################################################
if hasSoftware "sqlite3"; then
    alias sqlite3="sqlite3 -unsafe-testing -init ~/lib/sqlite/init.sql"
fi

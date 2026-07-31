#!/usr/bin/env /opt/homebrew/bin/zsh

local optBoringList="boring l"
local optBoringOpenKycdd="boring o kycdd"
local optBoringCloseKycdd="boring c kycdd"

local optLazyssh="lazyssh"

local optYazi="yazi"
local optSpf="spf"
local optClifm="clifm"
local optXplr="xplr"
local optLf="lf" # Terminal file manager
local optBroot="broot -s"

local menuBoring=("$optBoringList" "$optBoringOpenKycdd" "$optBoringCloseKycdd")
local menuGit=("$optLazyssh")
local menuFiles=("$optYazi" "$optSpf" "$optClifm" "$optXplr" "$optLf" "$optBroot")

local displayMenu=($menuFiles)

# menuOpt=$(gum filter "$optBoringList" "$optBoringOpenKycdd" "$optBoringCloseKycdd" "$optLazyssh" "$optYazi" "$optSpf" "$optClifm" "$optXplr" "$optLf" "$optBroot")
menuOpt=$(gum filter $displayMenu)

eval $menuOpt

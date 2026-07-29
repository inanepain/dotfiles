#!/usr/bin/env /opt/homebrew/bin/zsh

local optBoringList="boring l"
local optBoringOpenKycdd="boring o kycdd"
local optBoringCloseKycdd="boring c kycdd"
local optLazyssh="lazyssh"
local optYazi="yazi"
local optSpf="spf"
local optClifm="clifm"
local optXplr="xplr"
local optBroot="broot -s"

menuOpt=$(gum filter "$optBoringList" "$optBoringOpenKycdd" "$optBoringCloseKycdd" "$optLazyssh" "$optYazi" "$optSpf" "$optClifm" "$optXplr" "$optBroot")

eval $menuOpt

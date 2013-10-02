#!/bin/sh
# Functions that are for osx.
# Some of thesee function are from here: https://github.com/mathiasbynens/dotfiles/blob/master/.functions

# Add note to Notes.app (OS X 10.8)
# Usage: `note 'title' 'body'` or `echo 'body' | note`
# Title is optional
#function note() {
#    local title
#    local body
#    if [ -t 0 ]; then
#        title="$1"
#        body="$2"
#    else
#        title=$(cat)
#    fi
#  osascript >/dev/null <<EOF
#tell application "Notes"
#    tell account "iCloud"
#          tell folder "Notes"
#               make new note with properties {name:"$title", body:"$title" & "<br><br>" & "$body"}
#          end tell
#    end tell
#end tell
#EOF
#}

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
#function remind() {
#local text
#if [ -t 0 ]; then
#    text="$1" # argument
#else
#    text=$(cat) # pipe
#fi
#osascript >/dev/null <<EOF
#tell application "Reminders"
#     tell the default list
#          make new reminder with properties {name:"$text"}
#     end tell
#end tell
#EOF
#}

# Manually remove a downloaded app or file from the quarantine
function unquarantine() {
    for attribute in com.apple.metadata:kMDItemDownloadedDate com.apple.metadata:kMDItemWhereFroms com.apple.quarantine; do
        xattr -r -d "$attribute" "$@"
    done
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}


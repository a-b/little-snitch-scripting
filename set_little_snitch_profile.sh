#!/bin/sh

set_little_snitch_profile() {

	DEFAULT_LS_PROFILE="!OFF"

osascript <<EOD
tell application "System Events"
	if not (exists process "Little Snitch Configuration") then
		activate application "Little Snitch Configuration"
	end if

	tell process "Little Snitch Configuration"
		set _profile to "${1:-$DEFAULT_LS_PROFILE}"

		set _row to rows of outline 1 of scroll area 1 of splitter group 1 of window 1 whose value of static text 1 of UI element 1 is _profile

		set _cell to UI element 1 of item 1 of _row
		set _label to get value of static text 1 of _cell

		log "Profile: " & (_label)

		if not value of checkbox 1 of _cell as boolean then
			log "	Click"
			click checkbox 1 of _cell
		else
			log "	Already checked"
		end if
	end tell
end tell

EOD
}

set_little_snitch_profile $1

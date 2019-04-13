set_little_snitch_profile() {

	DEFAULT_LS_PROFILE="!OFF"

osascript <<EOD

tell application "System Events"
	if not (exists process "Little Snitch Configuration") then
		activate application "Little Snitch Configuration"
	end if

	tell process "Little Snitch Configuration"
		set _outline to outline 1 of scroll area 1 of splitter group 1 of window 1

		set _outline_rows_cnt to count every row of _outline

		set _row_lbl_profile_idx to 16

		repeat with _row in rows _row_lbl_profile_idx thru _outline_rows_cnt of _outline

			tell _row
				try
					set _cell to UI element 1 of _row
					set _label to get value of static text 1 of _cell

					set _profile to "${1:-$DEFAULT_LS_PROFILE}"

					set _row_lbl_suggestions to "Suggestions"
					if _label is _row_lbl_suggestions then
						exit repeat
					end if

					if _label is _profile then
						log "Profile: " & (_label)

						if not value of checkbox 1 of _cell as boolean then
							log "	Click"
							click checkbox 1 of _cell
						else
							log "	Already checked"
						end if
					end if
				end try
			end tell
		end repeat
	end tell
end tell

EOD
}

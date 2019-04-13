## Goal

This project is an attempt to automate [Little Snitch](https://www.obdev.at/products/littlesnitch) profile selector

## How to use it?

The Apple Script is wrapped into the shell to pass parameter.
- Open Little Snitch Preferences --> Security --> Allow GUI Scripting access
- Start from configuring default firewall profile [set_little_snitch_profile.sh#L3](set_little_snitch_profile.sh#L3)
- Source `. ./set_little_snitch_profile.sh`
- Run `set_little_snitch_profile [NAME_OF_YOUR_PROFILE]`

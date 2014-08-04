tellstick_plist2conf
====================

A small script that converts your Tellstick devices from the format stored when using TelldusCenter on Mac OS X to the format (tellstick.conf) used if you have the Tellstick Linux command line tools.

Usage:

ruby tellstick_plist_converter.rb

Edit the file if you want to change the input file. The converted data is displayed on stdout, which you can pipe to a tellstick.conf file.

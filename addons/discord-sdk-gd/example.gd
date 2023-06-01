class_name DiscordSDKTutorial
extends Node

## 1. Put the addons/ folder in your Godot project[br]
## 2. Enable the addon in your Project Settings under "Plugins" and "DiscordSDK". [br](if it doesn't show up restart your project and try again)[br]
## 3. Restart your project[br]
## 4. Create an Application under https://discord.com/developers/applications and get the Application ID br]
## 5. (optional) Set images under "Rich Presence" and "Art Assets" and remember the keys[br]
##
## This is your [code]_ready()[/code] function wich could be anywhere
## [codeblock]
func _ready():
	# Application ID
	discord_sdk.app_id = 1112929190921121792
	# this is boolean if everything worked
	print("Discord working: " + str(discord_sdk.get_is_discord_working()))
	# Set the first custom text row of the activity here
	discord_sdk.details = "A demo activity by vaporvee#1231"
	# Set the second custom text row of the activity here
#	discord_sdk.state = "Checkpoint 23/23"
	# Image key for small image from "Art Assets" from the Discord Developer website
	discord_sdk.large_image = "game"
	# Tooltip text for the large image
#    discord_sdk.large_image_text = "Try it now!"
	# Image key for large image from "Art Assets" from the Discord Developer website
#    discord_sdk.small_image = "boss"
	# Tooltip text for the small image
#   discord_sdk.small_image_text = "Fighting the end boss! D:"
	# "02:41 elapsed" timestamp for the activity
	discord_sdk.start_timestamp = int(Time.get_unix_time_from_system())
	# "59:59 remaining" timestamp for the activity
#    discord_sdk.end_timestamp = int(Time.get_unix_time_from_system()) + 3600
	# Always refresh after changing the values!
	discord_sdk.refresh() 
## [codeblock]
##
## @tutorial(More information here): https://github.com/vaporvee/discord-sdk-godot/wiki/Quick-start
## @tutorial(Make your Application ID and else here): https://discord.com/developers/applications

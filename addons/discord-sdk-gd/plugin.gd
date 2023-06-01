@tool
extends EditorPlugin

const DiscordSDKDebug = preload("res://addons/discord-sdk-gd/nodes/debug.gd")
const DiscordSDKDebug_icon = preload("res://addons/discord-sdk-gd/nodes/assets/Debug.svg")
var loaded_DiscordSDKDebug = DiscordSDKDebug.new()


const ExportPlugin = preload("res://addons/discord-sdk-gd/export.gd")
var loaded_exportplugin = ExportPlugin.new()


func _enter_tree() -> void:
	add_custom_type("DiscordSDKDebug","Node",DiscordSDKDebug,DiscordSDKDebug_icon)
	add_autoload_singleton("DiscordSDKLoader", "res://addons/discord-sdk-gd/nodes/core_updater.gd")
	add_export_plugin(loaded_exportplugin)

func _enable_plugin() -> void:
	print("DiscordSDK Addon got enabled (PLEASE  RESTART THE EDITOR)")
	ProjectSettings.set_setting("DiscordSDK/EditorPresence/enabled",false)
	ProjectSettings.set_initial_value("DiscordSDK/EditorPresence/enabled",false)
	ProjectSettings.set_restart_if_changed("DiscordSDK/EditorPresence/enabled",true)

func _disable_plugin() -> void:
	print("DiscordSDK Addon got disabled")
	remove_autoload_singleton("DiscordSDKLoader")
	remove_custom_type("DiscordSDKDebug")
	ProjectSettings.clear("DiscordSDK/EditorPresence/enabled")

func  _process(_delta):
	if(ProjectSettings.get_setting("DiscordSDK/EditorPresence/enabled")&&!get_editor_interface().is_playing_scene()):
		if(discord_sdk.app_id != 1108142249990176808):
			discord_sdk.app_id = 1108142249990176808
			discord_sdk.details = ProjectSettings.get_setting("application/config/name")
			discord_sdk.state = "Editing: \""+ str(get_tree().edited_scene_root.scene_file_path).replace("res://","") +"\""
			discord_sdk.large_image = "godot"
			discord_sdk.large_image_text = str(Engine.get_version_info().string)
			discord_sdk.start_timestamp = int(Time.get_unix_time_from_system())
			discord_sdk.refresh()
		if(discord_sdk.app_id == 1108142249990176808):
			discord_sdk.coreupdate()

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

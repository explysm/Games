extends Node
var config = ConfigFile.new()
var save_path = "user://data.cfg"

var hoodie : int = 0

var money : int = 0
var multiplier : int = 0
var music : bool = false

var blue : bool = false
var red : bool = false

var lavendervase : bool = false
var hat : int = 0

# ---

func _ready():
	# Automatically try to load the data when the script starts
	v.load()
	# You can call save() whenever your game state changes (e.g., player buys something)

# ---

func load():
	# 1. ATTEMPT TO LOAD THE FILE from the path. This is the crucial missing step!
	var load_result = config.load(save_path)
	
	# 2. CHECK if loading was successful. If the file doesn't exist, skip reading.
	if load_result != OK:
		# print("Save file not found or load error: ", load_result)
		# Defaults (0, false) remain, which is correct for a new game.
		return
	
	# 3. READ THE VALUES, now that the ConfigFile object is populated.
	hoodie = config.get_value("Player", "Hoodies", 0)
	money = config.get_value("Player", "Money", 0)
	multiplier = config.get_value("Player", "Multiplier", 0)
	blue = config.get_value("Player", "Blue", false)
	red = config.get_value("Player", "Red", false)

	music = config.get_value("Settings", "Music", false)
	
	lavendervase = config.get_value("Player", "LavenderVase", false)
	hat = config.get_value("Player", "hat", 0)
	# print("Data loaded successfully.")

func save():
	# 1. SET THE VALUES in the ConfigFile object.
	config.set_value("Player", "Hoodies", hoodie)
	config.set_value("Player", "Money", money)
	
	config.set_value("Player", "Multiplier", multiplier)
	config.set_value("Player", "Blue", blue)
	config.set_value("Player", "Red", red)
	
	config.set_value("Settings", "Music", music)
	config.set_value("Player", "LavenderVase", lavendervase)
	config.set_value("Player", "hat", hat)
	# 2. SAVE THE CONFIG FILE to the disk path.
	var save_result = config.save(save_path)
	if save_result != OK:
		# This handles errors during the save process (e.g., permission issues).
		print("Error saving file: ", save_result)
	# else:
		# print("Data saved successfully.")

func reset_game():
	## Fully resets the game back to bare minimum
	# 1. SET THE VALUES in the ConfigFile object.
	config.set_value("Player", "Hoodies", 0)
	config.set_value("Player", "Money", 0)
	
	config.set_value("Player", "Multiplier", 0)
	config.set_value("Player", "Blue", false)
	config.set_value("Player", "Red", false)
	
	config.set_value("Settings", "Music", false)
	config.set_value("Player", "LavenderVase", false)
	config.set_value("Player", "hat", 0)
	
	# 2. SAVE THE CONFIG FILE to the disk path.
	var save_result = config.save(save_path)
	if save_result != OK:
		# This handles errors during the save process (e.g., permission issues).
		print("Error saving file: ", save_result)
	# else:
		# print("Data saved successfully.")

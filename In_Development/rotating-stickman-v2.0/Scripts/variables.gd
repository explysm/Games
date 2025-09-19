extends Node
var config = ConfigFile.new()
var save_path = "user://data.cfg"

var hoodie : int = 0
var money : int = 0
var multiplier : int = 0
var music : bool = false
var blue : bool = false
var red : bool = false

func load():
	hoodie = config.get_value("Player", "Hoodies", 0)
	money = config.get_value("Player", "Money", 0)
	multiplier = config.get_value("Player", "Multiplier", 0)
	blue = config.get_value("Player", "Blue", false)
	red = config.get_value("Player", "Red", false)

	music = config.get_value("Settings", "Music", false)
func save():
	config.set_value("Player", "Hoodies", hoodie)
	config.set_value("Player", "Money", money)
	
	config.set_value("Player", "Multiplier", multiplier)
	config.set_value("Player", "Blue", blue)
	config.set_value("Player", "Red", red)
	
	config.set_value("Settings", "Music", music)
	config.save(save_path)

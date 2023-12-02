extends Node

enum ia_tag { CREATE, DROP, PICKUP, ACTIVATE, DEACTIVATE } 
var missions: Array[Mission] = []
var encrypted_actions = {}
var encrypted_objects = {}

func _ready():
	for key in ia_tag.keys():
		randomize_action(key)

func randomize_action(action: String):
	var randomized_word = ""
	var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	for i in action.length():
		var random_char = characters[randi() % characters.length()]
		randomized_word += random_char
	encrypted_actions[action] = randomized_word
	print(action + ": " + randomized_word)

func randomize_objects(obj: String):
	var randomized_word = ""
	var characters = "abcdefghijklmnopqrstuvwxyz"
	for i in obj.length():
		var random_char = characters[randi() % characters.length()]
		randomized_word += random_char
	encrypted_objects[obj] = randomized_word
	print(obj + ": " + randomized_word)

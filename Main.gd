extends Node2D


var save_filepath = "user://test.save"
var save
var save_object = preload("res://GameSave.gd")

func _ready():
	load_state()
	if save == null:
		$Text/Label.text += 'null'
	else:
		$Text/Label.text += save.text
	save_state()

func load_state():
	var save_file = File.new()
	if save_file.file_exists(save_filepath):
		save_file.open(save_filepath, File.READ)
		save = dict2inst(save_file.get_var())
		save_file.close()

func save_state():
	var new_save = save_object.new()
	new_save.init("foobar")
	var save_file = File.new()
	save_file.open(save_filepath, File.WRITE)
	save_file.store_var(inst2dict(new_save))
	save_file.close()

extends Node2D

@export var name_input: LineEdit

func _on_text_changed(new_text: String):
	Global.players_name = new_text

func _on_button_pressed():
	Global.players_name = name_input.text 
	get_tree().change_scene_to_file("res://scenes/forest.tscn")

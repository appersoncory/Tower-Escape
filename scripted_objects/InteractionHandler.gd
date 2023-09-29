extends Node

class_name Interaction_Handler

@export var display_name : String = "Object"
@export var interact_binding : String = "E"
@export var interact_prompt : String = "Interact"
@export var interact_symbol : Texture2D

signal on_interacted(instigator)

func handle_interaction(instigator):
	on_interacted.emit(instigator)

func get_interact_info():
	var interact_info = [display_name,interact_symbol]
	return(interact_info)

func _ready():
	var parent = self.get_parent()
	parent.interaction_handler = self
	on_interacted.connect(parent._on_interacted)
	parent.add_to_group("Interactive")

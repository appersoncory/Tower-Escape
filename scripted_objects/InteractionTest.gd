extends Node3D

var interaction_handler : Interaction_Handler

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_handler = get_node("InteractionHandler")
	interaction_handler.on_interacted.connect(_on_interacted)


func _on_interacted():
	print("Hello, I'm ", interaction_handler.display_name, ", and you just did a ", interaction_handler.interact_text,"!")

extends Node

@export var interact_text: String = "This is an interatable object."

var interaction_handler : Interaction_Handler

func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interacted(instigator):
	print(interact_text)

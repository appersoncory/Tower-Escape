extends StaticBody3D

@export var key_name : String

var interaction_handler : Interaction_Handler

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_interacted(instigator):
	var player = instigator as Player
	if(player):
		player.keyring.append(key_name)
		queue_free()

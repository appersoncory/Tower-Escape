extends AspectRatioContainer

class_name HUD

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_interact_info(info):
	$VBoxContainer/TargetNameLabel.text = info[0]
	$VBoxContainer/AspectRatioContainer/InteractIcon.texture = info[1]

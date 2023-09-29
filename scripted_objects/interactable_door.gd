@tool
extends Node3D
class_name Door

@export var is_locked : bool = false
@export var is_open : bool = false
@export var max_rotation : float = 90
@export var key_name : String
@export var remove_key_on_use : bool = false
@export var door_model : Mesh

var door_opening : bool = false
var door_closing : bool = false

var rotated_amount : float = 0
var door_speed : float = 2

var closed_rotation
var open_rotation

var interaction_handler : Interaction_Handler

func _ready():
	if not Engine.is_editor_hint():
		var door_mesh = get_node("DoorMesh") as MeshInstance3D
		door_mesh.mesh = door_model
		closed_rotation = global_rotation_degrees.y
		open_rotation = global_rotation_degrees.y + max_rotation
		if(is_open):
			global_rotation_degrees.y = open_rotation
			interaction_handler.interact_symbol = load("res://Icons/door.png")
		elif(is_locked):
			interaction_handler.interact_symbol = load("res://Icons/unlock.png")

func _process(delta):
	if Engine.is_editor_hint():
		$DoorMesh.mesh = door_model

func _on_interacted(instigator):
	if(is_open and not door_closing):
		close_door(instigator)
	elif(not is_open and not door_opening):
		if(is_locked):
			var door_opener := instigator as Player
			if(door_opener):
				if(door_opener.keyring.has(key_name)):
					is_locked = false
					interaction_handler.interact_symbol = load("res://Icons/door.png")
					open_door(instigator)
				else:
					pass
			else:
				pass
		else:
			open_door(instigator)
	else:
		pass
		
func close_door(instigator):
	door_closing = true
	rotated_amount = 0
	interaction_handler.interact_prompt = "Open"
	if(instigator.is_in_group("Player")):
		instigator.force_check_interact_info()
	
func open_door(instigator):
	door_opening = true
	rotated_amount = 0
	interaction_handler.interact_prompt = "Close"
	if(instigator.is_in_group("Player")):
		instigator.force_check_interact_info()
	
func _physics_process(delta):
	if(door_opening):
		rotate_y(door_speed * delta)
		rotated_amount = 180 - abs(abs(open_rotation - global_rotation_degrees.y) - 180);
		if((rotated_amount - 1) <= 0):
			door_opening = false
			is_open = true
			global_rotation_degrees.y = open_rotation

	elif(door_closing):
		rotate_y(-door_speed * delta)
		rotated_amount = 180 - abs(abs(closed_rotation - global_rotation_degrees.y) - 180);
		if((rotated_amount - 1) <= 0):
			door_closing = false
			is_open = false
			global_rotation_degrees.y = closed_rotation

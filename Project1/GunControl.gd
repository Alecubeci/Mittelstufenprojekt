extends Node3D

@export var startingWeapon : PackedScene
var hand
var equipped_weapon : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	hand = get_parent_node_3d().find_child("Hand")
	
	if startingWeapon:
		equipWeapon(startingWeapon)


func equipWeapon(weapon):
	if equipped_weapon:
		print("delete weapon")
		equipped_weapon.queue_free()
	else:
		print("no weapon")
		equipped_weapon = weapon.instantiate()
		hand.add_child(equipped_weapon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

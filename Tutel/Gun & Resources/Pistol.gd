extends Node3D

@export var Cartridge : PackedScene

@onready var rof = $Timer
var can_shoot = true

@export var bullet_speed = 30
@export var rpmWeapon = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	pass

func shoot():
	
	var newCartridge = Cartridge.instantiate()
	newCartridge.global_transform = $Muzzle.global_transform
	
	var scene_root = get_tree().get_root().get_children()[0]
	scene_root.add_child(newCartridge)
	print("shoot")
	can_shoot = false


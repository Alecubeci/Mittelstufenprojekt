extends Node3D

@export var Enemy : PackedScene #(And in the inspector drag and trop Enemy scene)
@onready var timer = $Timer
@export var num_enemies = 3
@export var seconds_between_spawns = 2



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

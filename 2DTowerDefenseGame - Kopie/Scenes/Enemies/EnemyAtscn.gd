extends CharacterBody2D

@export var speed = 100
var hp = 15
@onready var healthBar = get_node("HealthBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	
	if get_parent().get_progress_ratio() == 1:
		Game.health -= 10
		dead()
		
	
	if hp <= 0:
		Game.gold += 5
		dead()
		


func dead():
	get_parent().get_parent().queue_free()

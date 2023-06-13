extends PathFollow2D

@export var spawnInterval: float = 2.0  # Intervall zwischen dem Spawnen von Enemies in Sekunden
@export var enemyScene: PackedScene

var timer: Timer

func _ready():
	timer = Timer.new()
	timer.autostart = false
	timer.wait_time = spawnInterval
	add_child(timer)
	timer.connect_to_signal("timeout", self, "_on_spawn_timer_timeout")
	timer.start()

func start_spawning():
	timer.start()

func stop_spawning():
	timer.stop()

func _on_spawn_timer_timeout():
	if enemyScene != null:
		var enemy = enemyScene.instance()
		enemy.global_position = global_transform.origin
		get_parent().add_child(enemy)
	else:
		print("Enemy-Szene nicht festgelegt!")

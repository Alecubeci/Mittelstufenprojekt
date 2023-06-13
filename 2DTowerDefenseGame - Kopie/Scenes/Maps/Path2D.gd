extends Path2D


# Pfad zur Szene des Gegners
var enemy_scene = preload("res://Scenes/Enemies/EnemyAtscn.tscn")

# Timer
var spawn_timer

func _ready():
	# Initialisiere den Timer
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 5  # Wartezeit in Sekunden
	spawn_timer.one_shot = false  # Der Timer läuft immer wieder
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	add_child(spawn_timer)  # Füge den Timer zum Baum hinzu
	spawn_timer.start()  # Starte den Timer

func _on_spawn_timer_timeout():
	# Diese Funktion wird aufgerufen, wenn der Timer abläuft
	spawn_enemy()

func spawn_enemy():
	# Erzeuge eine neue Instanz des Gegners
	var enemy = enemy_scene.instance()
	# Füge den Gegner zum Baum hinzu
	add_child(enemy)
	# Setze die Position des Gegners, etc. hier

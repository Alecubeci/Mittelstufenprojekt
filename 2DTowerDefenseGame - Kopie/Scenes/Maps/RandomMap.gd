extends TileMap
#
#@export var pathLength: int = 10
#
#func _ready():
#	generatePath()
#
#func generatePath():
#	var currentCell = Vector2(0, 0)  # Startpunkt des Pfads
#	var visitedCells = []
#
#	for i in range(pathLength):
#		visitedCells.append(currentCell)
#		var availableCells = getAvailableCells(currentCell, visitedCells)
#
#		if availableCells.size() > 0:
#			var nextCell = availableCells[randi() % availableCells.size()]
#			currentCell = nextCell
#		else:
#			break
#
#	# Den Pfad verwenden, um den Spielwelt zu aktualisieren (z. B. Zellen als Pfad markieren)
#	updateWorld(visitedCells)
#
#func getAvailableCells(currentCell, visitedCells):
#	var availableCells = []
#	var directions = [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)]  # Nachbarrichtungen
#
#	for direction in directions:
#		var neighborCell = currentCell + direction
#
#		if !visitedCells.includes(neighborCell):
#			availableCells.append(neighborCell)
#
#	return availableCells
#
#func updateWorld(visitedCells):
#	for cell in visitedCells:
#		pass
#		# Aktualisiere die Zelle in der Spielwelt entsprechend (z. B. als Pfad markieren)
#		# Beispiel: $TileMap.set_cellv(cell, pathTileIndex)

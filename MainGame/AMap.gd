extends Spatial


var all_points = {}
var astar = null
onready var gridmap = $GridMap

func _ready():
	astar = AStar.new()
	var cells = gridmap.get_used_cells()
	
	for cell in cells:
		var ind = astar.get_available_point_id()
		astar.add_point(ind, gridmap.map_to_world(cell.x, cell.y, cell.z))
		all_points[v3_to_index(cell)] = ind
		
func v3_to_index(v3):
	return str(int(round(v3.x))) + "," + str(int(round(v3.y))) + "," + str(int(round(v3.z)))

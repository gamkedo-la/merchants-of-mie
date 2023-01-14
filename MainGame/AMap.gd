extends Spatial


var all_points = {}
var astar: AStar = null
onready var gridmap = $GridMap

func _ready():
	astar = AStar.new()
	var cells = gridmap.get_used_cells()
	
	for cell in cells:
		var ind = astar.get_available_point_id()
		astar.add_point(ind, gridmap.map_to_world(cell.x, cell.y, cell.z))
		all_points[v3_to_index(cell)] = ind
		
	for cell in cells:
		for x in [-1,0,1]:
			for y in [-1,0,1]:
				for z in [-1,0,1]:
					var v3 = Vector3(x,y,z)
					if v3 == Vector3(0,0,0):
						continue
					if v3_to_index(v3 + cell) in all_points:
						var ind1 = all_points[v3_to_index(cell)]
						var ind2 = all_points[v3_to_index(v3 + cell)]
						if !astar.are_points_connected(ind1, ind2):
							astar.connect_points(ind1, ind2, true)
		
func v3_to_index(v3):
	return str(int(round(v3.x))) + "," + str(int(round(v3.y))) + "," + str(int(round(v3.z)))
	
func world_points_to_astar_points(start_point: Vector3, end_point: Vector3) -> Dictionary: 
	var gm_start = v3_to_index(gridmap.world_to_map(start_point))
	var gm_end = v3_to_index(gridmap.world_to_map(end_point))
	var start_id = 0
	var end_id = 0
	if gm_start in all_points:
		start_id = all_points[gm_start]
	else:
		start_id = astar.get_closest_point(start_point)
		
	if gm_end in all_points:
		end_id = all_points[gm_end]
	else:
		end_id = astar.get_closest_point(end_point)	
	return { 'start': start_id, 'end' : end_id}

func get_path_to_node(world_start: Vector3, world_end: Vector3) -> PoolVector3Array:
	var astar_points: Dictionary = world_points_to_astar_points(world_start, world_end)
	return astar.get_point_path(astar_points.start, astar_points.end)
	
func get_path_cost(world_start, world_end) -> int:
	var astar_points: Dictionary = world_points_to_astar_points(world_start, world_end)
	var point_path: PoolVector3Array = astar.get_point_path(astar_points.start, astar_points.end)
	var path_cost = point_path.size() - 1 # Point path will include starting position, subtract it for real cost
	return path_cost


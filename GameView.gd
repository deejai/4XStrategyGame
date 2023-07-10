extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var map_mesh: MeshInstance3D = $MeshInstance3D2
@onready var map_material: ShaderMaterial = map_mesh.get_active_material(0)

func _ready():
	pass # Replace with function body.


func _process(delta):
	var horz_pan = Input.get_axis("Pan Left", "Pan Right")
	var vert_pan = Input.get_axis("Pan Up", "Pan Down")
	
	# This normalizes the pan vector. But I think it actually feels worse this way
#	var pan_mag: float = sqrt(pow(horz_pan,2) + pow(vert_pan,2))
#	if pan_mag > 0.0:
#		horz_pan /= pan_mag
#		vert_pan /= pan_mag

	camera.position.z = clamp(camera.position.z + vert_pan * delta * 5.0, -3.8, 4.2)
	var map_uv_offset: Vector3 = map_material.get_shader_parameter("uv1_offset")
	map_material.set_shader_parameter("uv1_offset", Vector3(map_uv_offset.x + horz_pan * delta * 0.35, map_uv_offset.y, map_uv_offset.z))

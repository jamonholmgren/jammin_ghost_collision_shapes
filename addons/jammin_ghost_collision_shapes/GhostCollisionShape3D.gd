# Useful collision shape for debugging collision shapes in the Godot editor.
# By Jamon Holmgren (jammin.games)
@tool
class_name GhostCollisionShape3D extends CollisionShape3D

@export_group("Debugging Collision Shapes")
@export var editor_debug_shape: bool = false:
	set(value):
		editor_debug_shape = value
		if Engine.is_editor_hint(): _enable_editor_debug_shape(value)

func _process(_delta):
	if not Engine.is_editor_hint() or not editor_debug_shape: return
	if Engine.get_process_frames() % 30 != 0: return
	_enable_editor_debug_shape(editor_debug_shape) # update the mesh every 30 frames

func _enable_editor_debug_shape(value: bool):
	# Remove the existing mesh if it exists
	if has_node("EditorShapeMesh"): remove_child(get_node("EditorShapeMesh"))
	if not value: return
	if not shape: push_error("GhostCollisionShape3D: No shape set!"); return
	
	# Add a new mesh if requested
	var mi = MeshInstance3D.new()
	mi.name = "EditorShapeMesh"
	
	# Create the shader material
	var material = ShaderMaterial.new()
	var shader_code = load("res://addons/jammin_ghost_collision_shapes/ghost_swirl.gdshader")
	if shader_code:
		material.shader = shader_code
	else:
		push_error("Could not load ghost_swirl shader!")
	
	# Apply the material to the mesh instance
	mi.material_override = material
	
	if shape is SphereShape3D:
		mi.mesh = SphereMesh.new()
		mi.mesh.radius = shape.radius
		mi.mesh.height = shape.radius * 2
	elif shape is BoxShape3D:
		mi.mesh = BoxMesh.new()
		mi.mesh.size = shape.size
	elif shape is CapsuleShape3D:
		mi.mesh = CapsuleMesh.new()
		mi.mesh.radius = shape.radius
		mi.mesh.height = shape.height
	elif shape is CylinderShape3D:
		mi.mesh = CylinderMesh.new()
		mi.mesh.top_radius = shape.radius
		mi.mesh.bottom_radius = shape.radius
		mi.mesh.height = shape.height
	elif shape is CapsuleShape3D:
		mi.mesh = CapsuleMesh.new()
		mi.mesh.radius = shape.radius
		mi.mesh.height = shape.height
	else:
		push_error("Unsupported shape: " + shape.get_class())
		return
	
	add_child(mi)


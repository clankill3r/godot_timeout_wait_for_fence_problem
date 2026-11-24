extends Node3D

@export var node_to_copy: Node3D
@export var amount := Vector3(2, 2, 2)
@export var spacing := Vector3(1, 1, 1)

func _ready():
	call_deferred("make_copies")

func make_copies():
	if node_to_copy == null:
		push_error("No node selected to copy!")
		return

	for z in range(1, amount.z + 1):
		for y in range(1, amount.y + 1):
			for x in range(1, amount.x + 1):
				var copy = node_to_copy.duplicate()
				add_child(copy)
				copy.global_position = node_to_copy.global_position + Vector3(spacing.x * x, spacing.y * y, spacing.z * z)

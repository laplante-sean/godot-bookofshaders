extends Node3D
class_name ShaderFrame

@export_category("Shader")
@export_file("*.gdshader") var shader_path


func _ready():
    var mat: ShaderMaterial = ShaderMaterial.new()
    var mesh: QuadMesh = $ShaderMesh.mesh
    var shader: Shader = load(shader_path)
    if shader_path != null:
        mesh.material = mat
        mat.shader = shader

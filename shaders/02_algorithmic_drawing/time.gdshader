shader_type spatial;


void fragment() {
	ALBEDO = vec3(abs(sin(TIME)), 0.0, 0.0);
}

shader_type canvas_item;

void fragment() {
    float y = UV.x;
    vec3 color = vec3(y);

    // Plot a line
    float pct = smoothstep(0.02, 0.0, abs(UV.y - UV.x));
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    COLOR = vec4(color, 1.0);
}
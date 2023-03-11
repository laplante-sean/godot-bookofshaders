shader_type spatial;

uniform float power = 5.0;

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) -
           smoothstep(pct, pct + 0.02, st.y);
}

void fragment() {
    // Examples: change what's commented out to see the different values
    float y = 0.0;
    y = pow(UV.x, power);

    // Add TIME so that we get some animation
    float x = UV.x + TIME;

    vec3 color = vec3(y);

    // Plot a line
    float pct = plot(UV, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    ALBEDO = vec3(color);
}
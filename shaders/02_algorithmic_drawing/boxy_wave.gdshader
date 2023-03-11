shader_type spatial;


float plot(vec2 st, float pct) {
    // Thicker line in this one with 0.04 instead of 0.02
    return smoothstep(pct - 0.02, pct, st.y) -
           smoothstep(pct, pct + 0.02, st.y);
}


void fragment() {
    float y = UV.x;
    float x = UV.x;
    vec3 color = vec3(y);
    
    y = 0.25 + smoothstep(0.0, 0.7, sin(x + TIME)) / 2.0;
    float pct = plot(UV, y);
    
    
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    ALBEDO = vec3(color);
}

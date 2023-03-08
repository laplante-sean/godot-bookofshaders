shader_type spatial;

uniform float power = 5.0;

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) -
           smoothstep(pct, pct + 0.02, st.y);
}

void fragment() {
    // Examples: change what's commented out to see the different values
    float y = 0.0;
    //y = pow(UV.x, power);
    //y = sqrt(UV.x);
    //y = UV.x;
    //y = step(0.5, UV.x);
    //y = smoothstep(0.1, 0.9, UV.x);
    //y = smoothstep(0.2, 0.5, UV.x) - smoothstep(0.5, 0.8, UV.x);
    //y = sin(((UV.x * PI) + TIME));
    //y = sin(UV.x);
    //y = sin(UV.x * PI);
    //y = sin((UV.x * TIME));
    //y = abs(sin(UV.x + TIME));;
    
    // Add TIME so that we get some animation
    float x = UV.x + TIME;
    
    // Sine wave options
    y = sin(x);
    y = sin(x * PI);
    y = sin(x * (2.0 * PI));

    // Move the sine wave into only positive values so it's not going off texture
    // (0,0) is top-left in Godot, so multiply by 0.5 to cut the applitude in half
    // making it produce values from -0.5 to 0.5, then add 0.5 to shift the whole
    // wave down so the values are all 0 to 1.0.
    y = (y * 0.5) + 0.5;

    // Make it even smaller
    //y = y * 0.5 + 0.5;
    //y = y * 0.5 + 0.5;
    //y = y * 0.5 + 0.5;
    //y = y * 0.5 + 0.5;

    vec3 color = vec3(y);

    // Plot a line
    float pct = plot(UV, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    ALBEDO = vec3(color);
}
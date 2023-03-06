shader_type canvas_item;

void fragment() {
    vec4 cur_color = texture(TEXTURE, UV);
    mediump float r = abs(sin(TIME * cur_color.r));
    mediump float g = abs(sin(TIME * cur_color.g));
    mediump float b = abs(sin(TIME * cur_color.b));
    mediump float a = cur_color.a;
    
    ivec2 size = textureSize(TEXTURE, 0);
    
    vec2 thing = FRAGCOORD.xy;
    
    COLOR = vec4(r, g, b, a);
}

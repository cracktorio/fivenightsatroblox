shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    // Get the UV coordinates of the current fragment
    vec2 uv = SCREEN_UV;
    float noise_scale = 1.0; // Adjust this value to make the noise bigger or smaller
	vec2 scaled_uv = uv * noise_scale;
    // Sample the original screen texture
    vec4 original_color = texture(screen_texture, uv);


    // Generate TV static noise
    float noise = (fract(sin(dot(scaled_uv.xy,vec2(12.9898,78.233) + TIME)) * 43758.5453));

    // Add the noise to the original color
	vec4 addnoise = vec4(vec3(noise), 0.0);
    vec4 static_color = original_color + addnoise;

    // Output the final color
    COLOR = static_color;
}



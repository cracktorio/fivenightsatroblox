shader_type canvas_item;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
	vec2 iResolution = (1.0 / SCREEN_PIXEL_SIZE);
	vec2 uv = FRAGCOORD.xy / iResolution.xy;
    vec2 uv_org = vec2(uv);

    float t = mod(TIME, 360.0);
    float t2 = floor(t * 0.6);

    float x, y, yt, xt;

    yt = abs(cos(t)) * rand(vec2(t, t)) * 100.0;
    xt = sin(360.0 * rand(vec2(t, t))) * 0.25;
    if (xt < 0.0) {
        xt = 0.125;
    }
    x = uv.x - xt * exp(-pow(uv.y * 100.0 - yt, 2.0) / 24.0);
    y = uv.y;
        
    uv.x = x;
    uv.y = y;

    yt = 0.5 * cos((yt / 100.0) / 100.0 * 360.0);
    float yr = 0.1 * cos((yt / 100.0) / 100.0 * 360.0);
    if (uv_org.y > yt && uv_org.y < yt + rand(vec2(t2, t)) * 0.25) {
        float md = mod(x * 100.0, 10.0);
        if (md * sin(t) > sin(yr * 360.0) || rand(vec2(md, md)) > 0.4) {
            vec4 org_c = texture(TEXTURE, uv);
            float colx = rand(vec2(t2, t2)) * 0.75;
            float coly = rand(vec2(uv.x + t, t));// * 0.5;
            float colz = rand(vec2(t2, t2));// * 0.5;
            // Invert the color of the noise
            vec3 inverted_noise_color = 1.0 - vec3(org_c.x + colx, org_c.y + colx, org_c.z + colx);
            COLOR = vec4(inverted_noise_color, 0.0);
        }
    }
    else if (y < cos(t) && mod(x * 40.0, 2.0) > rand(vec2(y * t, t * t)) * 1.0 ||  mod(y * 12.0, 2.0) < rand(vec2(x, t)) * 1.0) {
        if (rand(vec2(x + t, y + t)) > 0.8) {
            // Invert the color of the noise
            vec3 inverted_noise_color = 1.0 - vec3(rand(vec2(x * t, y * t)), rand(vec2(x * t, y * t)), rand(vec2(x * t, y * t)));
            COLOR = vec4(inverted_noise_color, 0.0);
        }
        else {
            COLOR = texture(TEXTURE, uv);
        }
    }
    else {
        uv.x = uv.x + rand(vec2(t, uv.y)) * 0.0087 * sin(y * 2.0);
        COLOR = texture(TEXTURE, uv);
    }
}

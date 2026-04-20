shader_type canvas_item;

uniform float time_scale = 2.0;
uniform float wave_strength = 0.02;
uniform float beam_width = 0.3;
uniform vec4 beam_color : source_color = vec4(0.6, 1.0, 0.8, 1.0);

void fragment() {
    vec2 uv = UV;

    // Center beam horizontally
    float dist = abs(uv.x - 0.5);

    // Beam shape (soft edges)
    float beam = smoothstep(beam_width, beam_width - 0.05, dist);

    // Wavy distortion
    float wave = sin((uv.y + TIME * time_scale) * 10.0) * wave_strength;

    beam *= smoothstep(0.5 + wave, 0.4 + wave, dist);

    // Fade top/bottom slightly
    float fade = uv.y;

    vec3 color = beam_color.rgb;
    float alpha = beam * fade;

    COLOR = vec4(color, alpha);
}



//	// Uncomment to replace the default light processing function with this one.
//}

shader_type canvas_item;

uniform float flash_strength : hint_range(0.0, 1.5) = 0.0;
uniform vec3 flash_color : source_color = vec3(1.0);

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	vec3 flash = mix(tex.rgb, flash_color, flash_strength);
	COLOR = vec4(flash, tex.a);
}

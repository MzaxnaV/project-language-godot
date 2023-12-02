shader_type canvas_item;

uniform bool filled;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (!filled) {
		float avg = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
		COLOR.rgb = vec3(avg);
	}
}
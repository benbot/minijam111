shader_type spatial;
uniform vec4 color : source_color;

void fragment() {
	ALBEDO = color.xyz;
}

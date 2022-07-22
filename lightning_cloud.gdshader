shader_type spatial;
render_mode cull_back;

uniform vec3 boltLocation = vec3(0.0);
uniform vec4 lightningColor : source_color;
uniform float boltSize = 0.0;
uniform float scale = 1.0;

float sphereDist(vec3 spot, vec3 boltLoc) {
	return distance(spot, (boltLoc));
}

void fragment() {
	vec3 me = (INV_VIEW_MATRIX * vec4(0.0, 0.0, 0.0, 1.0)).xyz;
	vec3 worldPos = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec3 dir = normalize(worldPos - me);
	vec3 boltLoc = MODEL_MATRIX[3].xyz + boltLocation;
	ALBEDO = lightningColor.xyz;
	EMISSION = lightningColor.xyz;
	ALPHA = max(1.0 - (sphereDist(worldPos, boltLoc) / (boltSize * scale)), 0.0);
}

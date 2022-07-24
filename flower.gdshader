shader_type spatial;

uniform float threshhold = 0.5;
uniform sampler2D ramp;
uniform sampler2D noise;

void fragment() {
	float val = texture(noise, UV).r;
	if (val < threshhold) {
		ALPHA = 0.0;
	} else {
		ALPHA = 1.0;
	}
}

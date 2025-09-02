shader_type spatial;

render_mode specular_schlick_ggx;

uniform float metallic : hint_range(0.0, 1.0) = 1.0;
uniform float roughness : hint_range(0.0, 1.0) = 0.1;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ROUGHNESS = roughness;

	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}

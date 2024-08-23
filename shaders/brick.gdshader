shader_type canvas_item;

uniform vec3 rgb : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if (color.r != 0.0 && color.g != 0.0 && color.b != 0.0){
		color.rgb = mix (color.rgb, rgb, 1);
		COLOR = color;	
	}
	
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

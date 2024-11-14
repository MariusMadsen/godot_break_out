shader_type canvas_item;

uniform vec2 tiling = vec2(1.0, 1.0);
uniform vec2 direction = vec2(1.0);
uniform float squash: hint_range(0.0, 0.001) = 0.1;
uniform float offset: hint_range(-0.5, 0.5) = 0.0;


void vertex() {
	UV = UV * tiling + TIME;
	float v = abs(VERTEX.y + offset) * squash + direction.x + sin(TIME)/2.0;
	VERTEX = VERTEX * vec2(v, direction.y);
	// Called for every vertex the material is visible on.
}

void fragment() {
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

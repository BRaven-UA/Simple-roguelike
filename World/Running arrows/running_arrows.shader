shader_type canvas_item;
render_mode unshaded;

uniform vec4 arrows_color: hint_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform vec4 background_color: hint_color = vec4(1.0, 1.0, 1.0, 0.0);
uniform float ratio: hint_range(0.0, 5.0) = 1.0;
uniform float speed: hint_range(0.0, 10.0) = 1.0;
uniform vec2 offset;	// make shadow effect with another instance

bool shape(float x, float y){
	float ay2 = abs(y - 0.5);
	return ay2 < x && ay2 > x - 0.5;}

void fragment(){
	float x = UV.x * ratio + offset.x;
	float y = UV.y + offset.y;
	x = mod(-x * 10.0 + TIME * speed, 1.0);
	bool arrow = shape(x, y);

	if(y < 0.1 || y > 0.9){
		arrow = false;}

	if (arrow){
		COLOR = arrows_color;}
	else {
		COLOR = background_color;}}
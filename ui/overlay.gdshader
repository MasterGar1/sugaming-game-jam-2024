shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 input = texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR = vec4(input.r * 0.5, input.g * 0.5, input.b * 0.5, input.a);
}
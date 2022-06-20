/// @description Setup surface
var _size_v = WINDOW_H - 388;
if !(surface_exists(surf_layers)) {
	surf_layers = surface_create(sprite_width, _size_v);
}

x = 0;
y = 357 + WINDOWS_BAR_YOFF;

surface_set_target(surf_layers);
draw_clear(col_bg_primary);

// Draw Layer selector
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(col_bg_secondary);
draw_text_scaled(9, 18, "Layers", font_regular, 8);

// Draw layer placement UI
draw_set_color(col_misc_0);
draw_rectangle(8, 24, sprite_width - 9, _size_v - 12, false);

draw_set_color(col_bg_secondary);
draw_rectangle(8, 24, sprite_width - 9, _size_v - 12, true);

// Draw Layers
var _count = 0;
var _layers_total = layers_get_last();
for (var i = _layers_total - 1; i >= 0 ; i--) {
	var _yoff = (24 * _count);
	if (LAYERS[| i] != undefined) {
		layers_draw(LAYERS[| i], 11, 28 + _yoff, 116, 20, (LAYERS[| i].id == layer_selected));
		_count++;
	}
}

// Draw "Add Layer"
var _yoff = (24 * _count);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(col_bg_secondary);
draw_rectangle(12, 29 + _yoff, 126, 47 + _yoff, true);
draw_text_scaled(69, 39 + _yoff, "+", font_regular, 16);


surface_reset_target();